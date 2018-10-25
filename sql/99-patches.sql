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

END;
$PATCHES$;
