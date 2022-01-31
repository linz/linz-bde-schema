#!/usr/bin/env bash

DB_NAME=
export PSQL=psql

if test "$1" = "--version"; then
    echo "@@VERSION@@ @@REVISION@@"
    exit 0
fi

if test -n "${BDESCHEMA_SQLDIR}"; then
    eport SCRIPTSDIR="${BDESCHEMA_SQLDIR}"
fi

while test -n "$1"; do
    DB_NAME=$1; shift
done

if test -z "$DB_NAME"; then
    echo "Usage: $0 { <database> | - }" >&2
    echo "       $0 --version" >&2
    exit 1
fi

export PGDATABASE=$DB_NAME

rollback()
{
    echo "ROLLBACK;"
    exit 1
}

{
cat << EOF
DO \$PUBLICATION\$
DECLARE
    v_table NAME;
BEGIN

    IF NOT EXISTS ( SELECT 1 FROM pg_catalog.pg_namespace
                    WHERE nspname = 'bde' )
    THEN
        RAISE EXCEPTION
            'Schema bde does not exist, '
            'run linz-bde-schema-load ?';
    END IF;
    IF NOT EXISTS ( SELECT 1 FROM pg_catalog.pg_publication
                    WHERE pubname = 'all_bde' )
    THEN
        CREATE PUBLICATION all_bde;
    END IF;
    ALTER PUBLICATION all_bde OWNER TO bde_dba;

    FOR v_table IN SELECT c.relname from pg_class c, pg_namespace n
        WHERE n.nspname = 'bde' and c.relnamespace = n.oid
        AND c.relkind = 'r' AND c.relname NOT IN (
            SELECT tablename FROM pg_catalog.pg_publication_tables
            WHERE pubname = 'all_bde' AND schemaname = 'bde'
        )
    LOOP
        EXECUTE format('ALTER PUBLICATION all_bde ADD TABLE bde.%I',
                       v_table);
    END LOOP;

    RAISE INFO 'Publication "all_bde" ready';

END;
\$PUBLICATION\$;

EOF
} |
grep -v "^\(BEGIN\|COMMIT\);" |
( echo "BEGIN;"; cat; echo "COMMIT;"; ) |
if test "$PGDATABASE" = "-"; then
    cat
else
    $PSQL -XtA --set ON_ERROR_STOP=1 -o /dev/null
fi
