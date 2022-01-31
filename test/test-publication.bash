#!/usr/bin/env bash

export PGDATABASE=linz-bde-schema-test-db

dropdb --if-exists ${PGDATABASE}
createdb ${PGDATABASE} || exit 1

linz-bde-schema-load $PGDATABASE
bdeTables=`psql -qXtAc "select count(*) from pg_class c, pg_namespace n WHERE c.relnamespace = n.oid and n.nspname = 'bde' and c.relkind = 'r'"`

compareTableCount() {
    exp=$bdeTables
    obt=`psql -qXtAc "select count(*) from pg_catalog.pg_publication_tables WHERE pubname = 'all_bde'"`

    test $exp = $obt || {
        echo "Expected $exp published tables in 'all_bde' publication, got $obt:" >&2
        list=`psql -qXtAc "select tablename from pg_catalog.pg_publication_tables WHERE pubname = 'all_bde'"`
        echo "$list" >&2
        exit 1
    }
}

linz-bde-schema-publish $PGDATABASE || exit 1
compareTableCount
echo "PASS: publication first run"

linz-bde-schema-publish $PGDATABASE || exit 1
compareTableCount
echo "PASS: publication second run"

linz-bde-schema-publish - | psql -qXtA $PGDATABASE || exit 1
compareTableCount
echo "PASS: publication third run via stdout"

dropdb $PGDATABASE

