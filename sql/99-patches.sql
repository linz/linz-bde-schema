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
SET search_path = bde, public;

DO $PATCHES$
BEGIN

IF NOT EXISTS (
    SELECT *
    FROM   pg_extension EXT, 
           pg_namespace NSP
    WHERE  EXT.extname = 'dbpatch' 
    AND    NSP.oid = EXT.extnamespace 
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
    '
DO $$
BEGIN
IF EXISTS ( SELECT p.oid from pg_proc p, pg_namespace n
            WHERE p.proname = ''ver_is_table_versioned''
              AND p.pronamespace = n.oid
              AND n.nspname = ''table_version'' )
THEN
  IF table_version.ver_is_table_versioned(''bde'', ''crs_work'')
  THEN
      PERFORM table_version.ver_versioned_table_drop_column(''bde'', ''crs_work'', ''annotations'');
  ELSE
      ALTER TABLE bde.crs_work DROP COLUMN annotations;
  END IF;
END;
$$
'
);

END;
$PATCHES$;

