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
IF EXISTS ( SELECT * FROM pg_extension  WHERE extname = 'table_version' )
THEN
  IF table_version.ver_is_table_versioned('bde', 'crs_work')
  THEN
      PERFORM table_version.ver_versioned_table_drop_column('bde', 'crs_work', 'annotations');
  ELSE
      ALTER TABLE bde.crs_work DROP COLUMN annotations;
  END IF;
END IF;
END;
$$
$P$
);


-------------------------------------------------------------------------------
-- 1.0.3 View to support AIMS (QGIS Plugin) parcel labeling 
-------------------------------------------------------------------------------

PERFORM _patches.apply_patch(
  'BDE - 1.0.3: View to support AIMS (QGIS Plugin) parcel labeling',
  '
    CREATE VIEW parcel_appellation_view AS 
    SELECT bde_get_combined_appellation(crs_parcel.id, ''N'') AS appellation,
           crs_parcel.id AS par_id
    FROM   crs_parcel
    WHERE  crs_parcel.status = ''CURR'' 
    AND    crs_parcel.toc_code = ''PRIM'';

  ALTER TABLE parcel_appellation_view OWNER TO bde_dba;
  REVOKE ALL ON TABLE parcel_appellation_view FROM PUBLIC;
  GRANT SELECT ON TABLE parcel_appellation_view TO aims_user;
  GRANT SELECT ON TABLE parcel_appellation_view TO bde_user;
  );
  '

END;
$PATCHES$;

