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

DO $PATCHES$
BEGIN

IF NOT EXISTS (
    SELECT *
    FROM   pg_class CLS,
           pg_namespace NSP
    WHERE  CLS.relname = 'applied_patches'
    AND    NSP.oid = CLS.relnamespace
    AND    NSP.nspname = '_patches'
) THEN
    RAISE EXCEPTION 'dbpatch extension is not installed correctly';
END IF;

-- Patches start from here

-------------------------------------------------------------------------------
-- 1.0.2 Remove annotations column from crs_work
-------------------------------------------------------------------------------

PERFORM _patches.apply_patch(
    'BDE - 1.0.2: Remove annotations column from bde.crs_work',
    $P$
DO $$
BEGIN
-- If table is versioend, use table_version API to add columns
IF EXISTS (SELECT p.oid FROM pg_catalog.pg_proc p,
                             pg_catalog.pg_namespace n
                        WHERE p.proname = 'ver_is_table_versioned'
                        AND n.oid = p.pronamespace
                        AND n.nspname = 'table_version')
THEN
  IF table_version.ver_is_table_versioned('bde', 'crs_work')
  THEN
      PERFORM table_version.ver_versioned_table_drop_column('bde', 'crs_work', 'annotations');
      RETURN;
  END IF;
END IF;
-- Otherwise use direct ALTER TABLE
ALTER TABLE bde.crs_work DROP COLUMN annotations;
END;
$$
$P$
);

-------------------------------------------------------------------------------
-- 1.2.0 Remove tan columns from crs_transact_type
-------------------------------------------------------------------------------

PERFORM _patches.apply_patch(
    'BDE 1.2.0 / LOL 3.17: Remove tan column from bde.crs_transact_type',
    $P$
DO $$
BEGIN
-- If table is versioend, use table_version API to drop columns
IF EXISTS (SELECT p.oid FROM pg_catalog.pg_proc p,
                             pg_catalog.pg_namespace n
                        WHERE p.proname = 'ver_is_table_versioned'
                        AND n.oid = p.pronamespace
                        AND n.nspname = 'table_version')
THEN
    IF table_version.ver_is_table_versioned('bde', 'crs_transact_type')
    THEN
        PERFORM table_version.ver_versioned_table_drop_column(
            'bde',
            'crs_transact_type',
            'tan_required'
        );
        PERFORM table_version.ver_versioned_table_drop_column(
            'bde',
            'crs_transact_type',
            'creates_tan'
        );
        RETURN;
    END IF;
END IF;
-- Otherwise use direct ALTER TABLE
ALTER TABLE bde.crs_transact_type DROP COLUMN tan_required;
ALTER TABLE bde.crs_transact_type DROP COLUMN creates_tan;
END;
$$
$P$
);

-------------------------------------------------------------------------------
-- 1.2.0 Add img_id and description columns to crs_stat_act_parcl
-------------------------------------------------------------------------------

PERFORM _patches.apply_patch(
    'BDE 1.2.0 / LOL 3.17: Add img_id and description columns to bde.crs_stat_act_parcl',
    $P$
DO $$
BEGIN
-- If table is versioned, use table_version API to add columns
IF EXISTS (SELECT p.oid FROM pg_catalog.pg_proc p,
                             pg_catalog.pg_namespace n
                        WHERE p.proname = 'ver_is_table_versioned'
                        AND n.oid = p.pronamespace
                        AND n.nspname = 'table_version')
THEN
    IF table_version.ver_is_table_versioned('bde', 'crs_stat_act_parcl')
    THEN
        PERFORM table_version.ver_versioned_table_add_column(
            'bde',
            'crs_stat_act_parcl',
            'img_id',
            'INTEGER'
        );
        PERFORM table_version.ver_versioned_table_add_column(
            'bde',
            'crs_stat_act_parcl',
            'description',
            'VARCHAR'
        );
        RETURN;
  END IF;
END IF;
-- Otherwise use direct ALTER TABLE
ALTER TABLE bde.crs_stat_act_parcl ADD COLUMN img_id INTEGER;
ALTER TABLE bde.crs_stat_act_parcl ADD COLUMN description VARCHAR;
END;
$$
$P$
);

-------------------------------------------------------------------------------
-- LOL 3.19: Add user_type_list and user_type_list_flag columns
--           to bde.crs_transact_type
-------------------------------------------------------------------------------

PERFORM _patches.apply_patch(
    'LOL 3.19: Add user_type_list and user_type_list_flag columns to bde.crs_transact_type',
    $P$
DO $$
DECLARE
  v_isversioned BOOL;
BEGIN

  v_isversioned := false;

  IF EXISTS (SELECT p.oid
             FROM pg_catalog.pg_proc p, pg_catalog.pg_namespace n
             WHERE p.proname = 'ver_is_table_versioned'
             AND n.oid = p.pronamespace
             AND n.nspname = 'table_version')
  THEN
    IF table_version.ver_is_table_versioned('bde', 'crs_transact_type')
    THEN
      v_isversioned := true;
    END IF;
  END IF;

  -- If table is versioned, use table_version API to add columns
  IF v_isversioned
  THEN
      PERFORM table_version.ver_versioned_table_add_column(
          'bde',
          'crs_transact_type',
          'user_type_list_flag',
          'CHAR(1)'
      );
      PERFORM table_version.ver_versioned_table_add_column(
          'bde',
          'crs_transact_type',
          'user_type_list',
          'VARCHAR(200)'
      );
  ELSE
    -- Otherwise use direct ALTER TABLE
    ALTER TABLE bde.crs_transact_type ADD COLUMN user_type_list_flag  CHAR(1);
    ALTER TABLE bde.crs_transact_type ADD COLUMN user_type_list VARCHAR(200);
  END IF;

END;
$$
$P$
);

-------------------------------------------------------------------------------
-- LOL 3.21: Add ver_datum_code column to bde.crs_work
--
-- This was precisely 3.21.18 adding that column
-- See https://github.com/linz/linz-bde-schema/pull/181#issuecomment-610620099
-------------------------------------------------------------------------------

PERFORM _patches.apply_patch(
    'LOL 3.21: Add ver_datum_code column to bde.crs_work',
    $P$
DO $$
DECLARE
  v_isversioned BOOL;
BEGIN

  v_isversioned := false;

  IF EXISTS (SELECT p.oid
             FROM pg_catalog.pg_proc p, pg_catalog.pg_namespace n
             WHERE p.proname = 'ver_is_table_versioned'
             AND n.oid = p.pronamespace
             AND n.nspname = 'table_version')
  THEN
    IF table_version.ver_is_table_versioned('bde', 'crs_work')
    THEN
      v_isversioned := true;
    END IF;
  END IF;

  -- If table is versioned, use table_version API to add columns
  IF v_isversioned
  THEN
      PERFORM table_version.ver_versioned_table_add_column(
          'bde',
          'crs_work',
          'ver_datum_code',
          'VARCHAR(4)'
      );
  ELSE
    -- Otherwise use direct ALTER TABLE
    ALTER TABLE bde.crs_work ADD COLUMN ver_datum_code VARCHAR(4);
  END IF;

END;
$$
$P$
);

--------------------------------------------------------------------------------
-- LOL 3.22b: Add crs_ttl_inst_protect table
--
-- Added in LOL-3.22b
--------------------------------------------------------------------------------

PERFORM _patches.apply_patch(
    'LOL 3.22p: Add crs_ttl_inst_protect table',
    $P$
DO $$
BEGIN

  CREATE TABLE bde.crs_ttl_inst_protect (
      id INTEGER PRIMARY KEY,
      tin_id INTEGER NOT NULL,
      protect_start DATE,
      protect_end DATE,
      protect_reference VARCHAR(100)
  );

  ALTER TABLE bde.crs_ttl_inst_protect OWNER TO bde_dba;

  REVOKE ALL
      ON TABLE bde.crs_ttl_inst_protect
      FROM public;

  GRANT UPDATE, INSERT, DELETE
      ON TABLE bde.crs_ttl_inst_protect
      TO bde_admin;

  GRANT SELECT
      ON TABLE bde.crs_ttl_inst_protect
      TO bde_user;

  -- If tables are versioned, version the new table
  IF EXISTS (SELECT p.oid FROM pg_catalog.pg_proc p,
                               pg_catalog.pg_namespace n
                          WHERE p.proname = 'ver_is_table_versioned'
                          AND n.oid = p.pronamespace
                          AND n.nspname = 'table_version')
  THEN
    IF table_version.ver_is_table_versioned('bde', 'crs_work')
    THEN
      PERFORM table_version.ver_enable_versioning('bde', 'crs_ttl_inst_protect');
    END IF;
  END IF;

END;
$$
$P$
);


--------------------------------------------------------------------------------
-- protect_reference column VARCHAR(100) > VARCHAR(255)
--
-- For tables bde.crs_title & bde.crs_ttl_inst_protect
-- as per https://github.com/linz/linz-bde-schema/issues/209
--------------------------------------------------------------------------------

PERFORM _patches.apply_patch(
    'LOL 3.22: Enlarge crs_title and crs_ttl_inst_protect protect_reference column to 255 chars',
    $P$
DO $$
DECLARE
  v_versioning_enabled BOOL;
  v_ctip_isversioned BOOL;
  v_ct_isversioned BOOL;

BEGIN

  v_versioning_enabled := false;
  v_ctip_isversioned := false;
  v_ct_isversioned := false;

  -- Is the DB versioned
  IF EXISTS (SELECT p.oid
             FROM pg_catalog.pg_proc p, pg_catalog.pg_namespace n
             WHERE p.proname = 'ver_is_table_versioned'
             AND n.oid = p.pronamespace
             AND n.nspname = 'table_version')
  THEN
    v_versioning_enabled := true;
  END IF;

  IF v_versioning_enabled
  THEN
    -- Is crs_ttl_inst_protect is versioned
    IF table_version.ver_is_table_versioned('bde', 'crs_ttl_inst_protect')
    THEN
      v_ctip_isversioned := true;
    END IF;
    -- Is crs_title is versioned
    IF table_version.ver_is_table_versioned('bde', 'crs_title')
    THEN
      v_ct_isversioned := true;
    END IF;
  END IF;

  -- If crs_ttl_inst_protect is versioned, use table_version API to chnage columns
  IF v_ctip_isversioned
  THEN
      PERFORM table_version.ver_versioned_table_change_column_type(
          'bde',
          'crs_ttl_inst_protect',
          'protect_reference',
          'VARCHAR(255)'
      );
  -- Otherwise use direct ALTER TABLE
  ELSE
    ALTER TABLE bde.crs_ttl_inst_protect
    ALTER COLUMN protect_reference TYPE VARCHAR(255);
  END IF;


  -- If crs_title is versioned, use table_version API to chnage columns
  IF v_ct_isversioned
  THEN
      PERFORM table_version.ver_versioned_table_change_column_type(
          'bde',
          'crs_title',
          'protect_reference',
          'VARCHAR(255)'
      );
  -- Otherwise use direct ALTER TABLE
  ELSE
    ALTER TABLE bde.crs_title
    ALTER COLUMN protect_reference TYPE VARCHAR(255);
  END IF;


END;
$$
$P$
);


END;
$PATCHES$;
