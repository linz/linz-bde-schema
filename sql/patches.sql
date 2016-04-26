--------------------------------------------------------------------------------
--
-- linz-bde-schema
--
-- Copyright 2016 Crown copyright (c)
-- Land Information New Zealand and the New Zealand Government.
-- All rights reserved
--
-- This software is released under the terms of the new BSD license. See the 
-- LICENSE file for more information.
--
--------------------------------------------------------------------------------
-- Patches to apply to BDE schema . Please note that the order of patches listed
-- in this file should be done sequentially i.e Newest patches go at the bottom
-- of the file. 
--------------------------------------------------------------------------------
SET client_min_messages TO WARNING;
SET search_path = lds, bde, public;

SELECT _patches.apply_patch(
    'BDE - 1.2.7: Rebuild primary keys using versioned table column key',
    '
DO $PATCH$
DECLARE
    v_schema_name             TEXT;
    v_table_name              TEXT;
    v_version_key_column      TEXT;
    v_table_primary_key       TEXT;
    v_table_primary_key_name  TEXT;
    v_table_unique_constraint TEXT;
    v_table_unqiue_index      TEXT;
    v_count                   INTEGER  := 0;
BEGIN
    FOR
        v_schema_name,
        v_table_name,
        v_version_key_column,
        v_table_primary_key,
        v_table_primary_key_name,
        v_table_unique_constraint,
        v_table_unqiue_index
    IN
        WITH versioned_tables AS (
            SELECT DISTINCT ON (CLS.oid)
                CLS.oid AS table_oid,
                NSP.nspname AS schema_name,
                CLS.relname AS table_name,
                ATT.attname as key_column
            FROM
                pg_index IDX,
                pg_attribute ATT,
                pg_namespace NSP,
                pg_class CLS
            WHERE
                IDX.indrelid = CLS.oid AND
                ATT.attrelid = CLS.oid AND
                ATT.attnum = ANY(IDX.indkey) AND
                ATT.attnotnull = TRUE AND
                IDX.indisunique = TRUE AND
                IDX.indexprs IS NULL AND
                IDX.indpred IS NULL AND
                format_type(ATT.atttypid, ATT.atttypmod) IN (''integer'', ''bigint'') AND
                array_length(IDX.indkey::INTEGER[], 1) = 1 AND
                NSP.nspname IN (''bde'') AND
                NSP.oid      = CLS.relnamespace AND
                CLS.relkind = ''r''
            ORDER BY
                CLS.oid,
                IDX.indisprimary DESC
        ),
        t AS (
            SELECT
                TBL.table_oid,
                TBL.schema_name,
                TBL.table_name,
                TBL.key_column AS version_key_column,
                string_agg(DISTINCT ATT.attname, '','') as table_primary_key,
                string_agg(DISTINCT CONP.conname, '','') AS table_primary_key_name,
                string_agg(DISTINCT CONU.conname, '','') AS table_unique_constraint
            FROM
                pg_index IDX,
                pg_attribute ATT,
                versioned_tables AS TBL
                JOIN pg_constraint CONP ON (CONP.conrelid = TBL.table_oid AND CONP.contype = ''p'')
                LEFT JOIN pg_constraint CONU ON (CONU.conrelid = TBL.table_oid AND CONU.contype = ''u'')
            WHERE
                IDX.indrelid = TBL.table_oid AND
                ATT.attrelid = TBL.table_oid AND 
                ATT.attnum   = any(IDX.indkey) AND
                IDX.indisprimary
            GROUP BY
                TBL.table_oid,
                TBL.schema_name,
                TBL.table_name,
                TBL.key_column
            HAVING
                TBL.key_column <> string_agg(ATT.attname, '','')
        )
        SELECT
            t.schema_name,
            t.table_name,
            t.version_key_column,     
            t.table_primary_key,
            t.table_primary_key_name,
            t.table_unique_constraint,
            CLS.relname as table_unqiue_index
        FROM
            t
            LEFT JOIN pg_index IDX ON (IDX.indrelid = t.table_oid AND IDX.indisunique AND NOT IDX.indisprimary)
            LEFT JOIN pg_class CLS ON (IDX.indexrelid = CLS.oid)
            LEFT JOIN pg_attribute ATT ON (ATT.attrelid = t.table_oid AND ATT.attname = t.version_key_column AND ATT.attnum = ANY(IDX.indkey))
        WHERE
            ATT.attname IS NOT NULL
        ORDER BY
            t.schema_name,
            t.table_name
    LOOP
        EXECUTE ''ALTER TABLE '' || v_schema_name || ''.'' || v_table_name || '' DROP CONSTRAINT  '' || v_table_primary_key_name;
        EXECUTE ''ALTER TABLE '' || v_schema_name || ''.'' || v_table_name || '' ADD PRIMARY KEY  ('' || v_version_key_column || '')'';
        IF v_table_unique_constraint IS NULL THEN
            EXECUTE ''DROP INDEX '' || v_schema_name || ''.'' || v_table_unqiue_index;
        ELSE
            EXECUTE ''ALTER TABLE '' || v_schema_name || ''.'' || v_table_name || '' DROP CONSTRAINT  '' || v_table_unique_constraint;
        END IF;
        EXECUTE ''ALTER TABLE '' || v_schema_name || ''.'' || v_table_name || '' ADD UNIQUE('' || v_table_primary_key || '')'';
        RAISE NOTICE ''Table %.% key changed to %'', v_schema_name, v_table_name, v_version_key_column;
        v_count := v_count + 1;
    END LOOP;
    RAISE NOTICE ''% Table keys changed'', v_count;
END;
$PATCH$
'
);


-------------------------------------------------------------------------------
-- crs_statute_column_width_increase patch
-------------------------------------------------------------------------------

SELECT _patches.apply_patch(
    'BDE - 1.3.5: Alter column width crs_statute/name_and_date from 100 to 200',
    '
DO $$
BEGIN

UPDATE pg_attribute SET atttypmod=200+4
WHERE attrelid = ''bde.crs_statute''::regclass
AND attname = ''name_and_date'';

IF EXISTS (SELECT * FROM pg_available_extensions WHERE name = ''table_version'')
    AND table_version.ver_is_table_versioned(''bde'', ''crs_statute'')
THEN
    UPDATE pg_attribute SET atttypmod=200+4
    WHERE attrelid = ''table_version.bde_crs_statute_revision''::regclass
    AND attname = ''name_and_date'';
END IF;

END;
$$
'
);

SELECT _patches.apply_patch(
    'BDE - 1.3.6: Add street addressing columns for Landonline 3.10',
    '
DO $$
BEGIN

IF EXISTS (SELECT * FROM pg_available_extensions WHERE name = ''table_version'')
    AND table_version.ver_is_table_versioned(''bde'', ''crs_road_name'')
THEN
    PERFORM table_version.ver_versioned_table_add_column(''bde'', ''crs_road_name'', ''sufi'', ''INTEGER'');
ELSE
    ALTER TABLE bde.crs_road_name ADD COLUMN sufi INTEGER;
END IF;

IF EXISTS (SELECT * FROM pg_available_extensions WHERE name = ''table_version'')
    AND table_version.ver_is_table_versioned(''bde'', ''crs_street_address'')
THEN
    PERFORM table_version.ver_versioned_table_add_column(''bde'', ''crs_street_address'', ''sufi'', ''INTEGER'');
    PERFORM table_version.ver_versioned_table_add_column(''bde'', ''crs_street_address'', ''overridden_mbk_code'', ''CHAR(1)'');
    PERFORM table_version.ver_versioned_table_add_column(''bde'', ''crs_street_address'', ''mbk_code'', ''VARCHAR(7)'');
ELSE
    ALTER TABLE bde.crs_street_address ADD COLUMN sufi INTEGER;
    ALTER TABLE bde.crs_street_address ADD COLUMN overridden_mbk_code CHAR(1);
    ALTER TABLE bde.crs_street_address ADD COLUMN mbk_code VARCHAR(7);
END IF;

END;
$$
'
);

-------------------------------------------------------------------------------
-- change column type for crs_estate_share, crs_title_estate and crs_legal_desc_prl
-------------------------------------------------------------------------------

SELECT _patches.apply_patch(
    'BDE - 1.4.0: Change col-type for crs_estate_share, crs_title_estate, crs_legal_desc_prl',
    '
DO $$
DECLARE
    v_version_ext  BOOLEAN;
BEGIN

v_version_ext := EXISTS (SELECT * FROM pg_available_extensions WHERE name = ''table_version'');

IF v_version_ext AND table_version.ver_is_table_versioned(''bde'', ''crs_estate_share'') THEN
    PERFORM table_version.ver_versioned_table_change_column_type(''bde'', ''crs_estate_share'', ''share'', ''VARCHAR(100)'');
ELSE
    ALTER TABLE bde.crs_estate_share ALTER COLUMN share TYPE VARCHAR(100);
END IF;

IF v_version_ext AND table_version.ver_is_table_versioned(''bde'', ''crs_title_estate'') THEN
    PERFORM table_version.ver_versioned_table_change_column_type(''bde'', ''crs_title_estate'', ''share'', ''VARCHAR(100)'');
ELSE
    ALTER TABLE bde.crs_title_estate ALTER COLUMN share TYPE VARCHAR(100);
END IF;

IF v_version_ext AND table_version.ver_is_table_versioned(''bde'', ''crs_legal_desc_prl'') THEN
    PERFORM table_version.ver_versioned_table_change_column_type(''bde'', ''crs_legal_desc_prl'', ''share'', ''VARCHAR(100)'');
ELSE
    ALTER TABLE bde.crs_legal_desc_prl ALTER COLUMN share TYPE VARCHAR(100);
END IF;

END;
$$
  '
);


-------------------------------------------------------------------------------
-- crs_title ttl_title_no_head_srs column add patch
-------------------------------------------------------------------------------

SELECT _patches.apply_patch(
    'BDE - 1.4.0: Add ttl_title_no_head_srs column to crs_title',
    '
DO $$
BEGIN

IF table_version.ver_is_table_versioned(''bde'', ''crs_title'') THEN
    PERFORM table_version.ver_versioned_table_add_column(''bde'', ''crs_title'', ''ttl_title_no_head_srs'', ''VARCHAR(20)'');
ELSE
    ALTER TABLE bde.crs_title ADD COLUMN ttl_title_no_head_srs VARCHAR(20);
END IF;

END;
$$
'
);

-------------------------------------------------------------------------------
-- crs_land_district usr_tm_id column add patch
-------------------------------------------------------------------------------

SELECT _patches.apply_patch(
    'BDE - 1.4.0: Add usr_tm_id to crs_land_district',
    '
DO $$
BEGIN

IF EXISTS (SELECT * FROM pg_available_extensions WHERE name = ''table_version'')
    AND table_version.ver_is_table_versioned(''bde'', ''crs_land_district'')
THEN
    PERFORM table_version.ver_versioned_table_add_column(''bde'', ''crs_land_district'', ''usr_tm_id'', ''VARCHAR(20)'');
ELSE
    ALTER TABLE bde.crs_land_district ADD COLUMN usr_tm_id VARCHAR(20);
END IF;

END;
$$
'
);

SELECT _patches.apply_patch(
    'BDE - 1.4.0: Add crs_image_history table',
    '
DO $$
BEGIN

    SET search_path = bde, public;
    
    CREATE TABLE crs_image_history  (
        id INTEGER NOT NULL,
        img_id INTEGER NOT NULL,
        ims_id DECIMAL(32),
        ims_date DATE,
        pages INTEGER,
        centera_id VARCHAR(65),
        centera_datetime TIMESTAMP,
        usr_id VARCHAR(20)
    );

    ALTER TABLE ONLY crs_image_history
        ADD CONSTRAINT pkey_crs_image_history PRIMARY KEY (id);

    ALTER TABLE crs_image_history OWNER TO bde_dba;

    REVOKE ALL ON TABLE crs_image_history FROM PUBLIC;
    GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE crs_image_history TO bde_admin;
    GRANT SELECT ON TABLE crs_image_history TO bde_user;
    
    IF EXISTS (SELECT * FROM pg_available_extensions WHERE name = ''table_version'')
        AND EXISTS (SELECT table_version.ver_get_versioned_tables())
    THEN
        PERFORM table_version.ver_enable_versioning(''bde'', ''crs_image_history'');
    END IF;

END;
$$
'
);

SELECT _patches.apply_patch(
    'BDE - 1.4.0: Add index on ttm_id for crs_title_mem_text',
    '
    DO $$
    BEGIN
        SET search_path = bde, public;
        IF NOT EXISTS (
            SELECT true
            FROM
                pg_class C, pg_namespace N
            WHERE C.relname = ''fk_tmt_ttm''
            and C.relnamespace = N.oid and N.nspname = ''bde''
        ) THEN
            CREATE INDEX fk_tmt_ttm ON crs_title_mem_text USING btree (ttm_id);
        END IF;
	END
	$$;
  '
);


SELECT _patches.apply_patch(
    'BDE - 1.6.0: Add new crs_image column for Landonline 3.11',
    '
DO $$
BEGIN

IF EXISTS (SELECT * FROM pg_available_extensions WHERE name = ''table_version'')
    AND table_version.ver_is_table_versioned(''bde'', ''crs_image'')
THEN
    PERFORM table_version.ver_versioned_table_add_column(''bde'', ''crs_image'', ''usr_id_created'', ''VARCHAR(20)'');
ELSE
    ALTER TABLE bde.crs_image ADD COLUMN usr_id_created VARCHAR(20);
END IF;

END;
$$
'
);

SELECT _patches.apply_patch(
    'BDE - 1.6.0: Add new crs_statute_action column for Landonline 3.11',
    '
DO $$
BEGIN

IF EXISTS (SELECT * FROM pg_available_extensions WHERE name = ''table_version'')
    AND table_version.ver_is_table_versioned(''bde'', ''crs_statute_action'')
THEN
    PERFORM table_version.ver_versioned_table_add_column(''bde'', ''crs_statute_action'', ''gazette_notice_id'', ''INTEGER'');
ELSE
    ALTER TABLE bde.crs_statute_action ADD COLUMN gazette_notice_id INTEGER;
END IF;

END;
$$
'
);