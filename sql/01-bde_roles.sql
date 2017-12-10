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
--SET client_min_messages TO WARNING;

DO $ROLES$
BEGIN

IF NOT EXISTS (SELECT * FROM pg_roles where rolname = 'bde_dba') THEN
    CREATE ROLE bde_dba
        NOSUPERUSER INHERIT CREATEDB CREATEROLE;
    ALTER ROLE bde_dba SET search_path=bde, bde_control, public;
END IF;
COMMENT ON ROLE bde_dba IS $COMMENT$
'Owns all objects in bde schema. Has rights to manage all of them.'
$COMMENT$;

IF NOT EXISTS (SELECT * FROM pg_roles where rolname = 'bde_admin') THEN
    CREATE ROLE bde_admin
        NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE;
    ALTER ROLE bde_admin SET search_path=bde, public;
END IF;
COMMENT ON ROLE bde_admin IS $COMMENT$
Everything that user can do plus the ability to edit data in the tables.
$COMMENT$;

IF NOT EXISTS (SELECT * FROM pg_roles where rolname = 'bde_user') THEN
    CREATE ROLE bde_user
        NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE;
    ALTER ROLE bde_user SET search_path=bde, public;
END IF;
COMMENT ON ROLE bde_user IS $COMMENT$
Has rights to execute and read anything that bde_dba creates.

Used by users logging in to run analytics queries or for remote users
to get access to data (e.g LDS import or QGIS desktop users)
$COMMENT$;

END;
$ROLES$;
