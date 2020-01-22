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

DO $ROLES$
BEGIN

-- bde_user

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

-- bde_admin

IF NOT EXISTS (SELECT * FROM pg_roles where rolname = 'bde_admin') THEN
    CREATE ROLE bde_admin
        NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE;
    ALTER ROLE bde_admin SET search_path=bde, public;
END IF;

GRANT bde_user TO bde_admin;

COMMENT ON ROLE bde_admin IS $COMMENT$
Everything that user can do plus the ability to edit data in the tables.
$COMMENT$;

-- bde_dba

IF NOT EXISTS (SELECT * FROM pg_roles where rolname = 'bde_dba') THEN
    CREATE ROLE bde_dba
        NOSUPERUSER INHERIT CREATEDB CREATEROLE;
    ALTER ROLE bde_dba SET search_path=bde, bde_control, public;
END IF;
COMMENT ON ROLE bde_dba IS $COMMENT$
'Owns all objects in bde schema. Has rights to manage all of them.'
$COMMENT$;

GRANT bde_admin TO bde_dba;

-- Calling user gets bde_dba grant

-- User loading this script must be part of the `bde_dba` team
-- in order to be able to give ownerhip of created objects
-- to it, instead of getting a message like:
--
--   ERROR:  must be member of role "bde_dba"
--
-- See https://github.com/linz/linz-bde-schema/issues/71
--
IF current_user != 'bde_dba' THEN
    EXECUTE 'GRANT bde_dba TO ' || quote_ident(current_user);
END IF;


END;
$ROLES$;
