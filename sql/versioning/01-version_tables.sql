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
-- Creates system tables required for table versioning support
--------------------------------------------------------------------------------

DO $$
DECLARE
   v_schema    NAME;
   v_table     NAME;
   v_msg       TEXT;
   v_rev_table TEXT;
   v_needs_rev BOOLEAN;
BEGIN

    IF NOT EXISTS (SELECT p.oid FROM pg_catalog.pg_proc p,
                                 pg_catalog.pg_namespace n
                            WHERE p.proname = 'ver_create_revision'
                            AND n.oid = p.pronamespace
                            AND n.nspname = 'table_version')
    THEN
        RETURN;
    END IF;

	-- Owners of versioned tables need to have
    -- CREATE permission on schema table_version
    -- See https://github.com/linz/linz-bde-schema/issues/70
    GRANT CREATE ON SCHEMA table_version TO bde_dba;

	-- It makes sense for bde_dba to also have SELECT permissions
    -- on sequences in table_version schema
    -- See https://github.com/linz/linz-bde-schema/issues/170
    GRANT SELECT ON ALL SEQUENCES IN SCHEMA table_version TO bde_dba;

    v_needs_rev := false;

    FOR v_schema, v_table IN
        SELECT
            NSP.nspname,
            CLS.relname
        FROM
            pg_class CLS,
            pg_namespace NSP
        WHERE
            CLS.relnamespace = NSP.oid AND
            NSP.nspname IN ('bde') AND
            CLS.relkind = 'r'
        ORDER BY
            1, 2
    LOOP
        IF table_version.ver_is_table_versioned(v_schema, v_table) THEN
            CONTINUE;
        END IF;

        v_msg := 'Versioning table ' ||  v_schema || '.' || v_table;
        RAISE NOTICE '%', v_msg;

        -- Create a generic revision if any unversioned table has data
        IF NOT v_needs_rev THEN
            EXECUTE 'SELECT EXISTS ( SELECT * FROM '
                || quote_ident(v_schema) || '.' || quote_ident(v_table)
                || ')'
            INTO v_needs_rev;
            IF v_needs_rev THEN
                PERFORM table_version.ver_create_revision('Initial revisioning for BDE tables');
            END IF;
        END IF;

        BEGIN
            PERFORM table_version.ver_enable_versioning(v_schema, v_table);
        EXCEPTION
            WHEN others THEN
                RAISE EXCEPTION 'Error versioning %.%. ERROR: %', v_schema, v_table, SQLERRM;
        END;

        SELECT table_version.ver_get_version_table_full(v_schema, v_table)
        INTO   v_rev_table;

        EXECUTE 'GRANT SELECT ON TABLE ' || v_rev_table || ' TO bde_user';
        -- SELECT is going to be inherited from bde_user role (granted to bde_admin)
        EXECUTE 'GRANT UPDATE, INSERT, DELETE ON TABLE ' || v_rev_table || ' TO bde_admin';
    END LOOP;

    IF v_needs_rev THEN
        PERFORM table_version.ver_complete_revision();
    END IF;

END
$$;

