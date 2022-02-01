#!/usr/bin/env bash

DB_NAME=
export SKIP_INDEXES=no
export ADD_REVISIONS=no
export EXTENSION_MODE=on # NOTE: "on" is not a typo, it's "on"/"off"
export READ_ONLY=no
export PSQL=psql
export SCRIPTSDIR=/usr/share/linz-bde-schema/sql/

if test "$1" = "--version"; then
    echo "@@VERSION@@ @@REVISION@@"
    exit 0
fi

usage() {
    cat <<EOF
Usage: $0 [options] { <database> | - }
       $0 { --version | --help }
Options:
    --noindexes     skips creation of indexes
    --revision      enable versioning on tables
    --noextension   avoid using extension version of dbpatch and tableversion
    --readonly      revoke write permission on schema from all bde roles
EOF
}


if test -n "${BDESCHEMA_SQLDIR}"; then
    SCRIPTSDIR=${BDESCHEMA_SQLDIR}
fi

if test ! -f "${SCRIPTSDIR}/02-bde_schema.sql"; then
    cat >&2 <<EOF
Cannot find 02-bde_schema.sql in ${SCRIPTSDIR}
Please set BDESCHEMA_SQLDIR environment variable
EOF
    exit 1
fi

while test -n "$1"; do
    if test $1 = "--noindexes"; then
        SKIP_INDEXES=yes
        shift; continue
    elif test $1 = "--revision"; then
        ADD_REVISIONS=yes
        shift; continue
    elif test $1 = "--readonly"; then
        READ_ONLY=yes
        shift; continue
    elif test $1 = "--help"; then
        usage && exit
    elif test $1 = "--noextension"; then
        EXTENSION_MODE=off
        shift; continue
    else
        DB_NAME=$1; shift
    fi
done

if test -z "$DB_NAME"; then
    usage >&2
    exit 1
fi

export PGDATABASE=$DB_NAME

rollback()
{
    echo "ROLLBACK;"
    exit 1
}

# Find dbpatch-loader
DBPATCH_LOADER=dbpatch-loader
which $DBPATCH_LOADER > /dev/null || {
    echo "$0 depends on $DBPATCH_LOADER, which cannot be found in current PATH." >&2
    echo "Did you install dbpatch ? (1.2.0 or later needed)" >&2
    exit 1
}

# Check if dbpatch-loader supports stdout
dbpatch-loader - fake 2>&1 | grep -q "database.*does not exist" &&
    DBPATCH_SUPPORTS_STDOUT=no ||
    DBPATCH_SUPPORTS_STDOUT=yes

if test $PGDATABASE = "-" -a $DBPATCH_SUPPORTS_STDOUT != yes; then
    echo "ERROR: dbpatch-loader does not support stdout mode, cannot proceed." >&2
    echo "HINT: install dbpatch 1.4.0 or higher to fix this." >&2
    exit 1
fi

DBPATCH_OPTS=
if test "${EXTENSION_MODE}" = "off"; then
    DBPATCH_OPTS="--no-extension"
fi

if test $DBPATCH_SUPPORTS_STDOUT != yes; then
    echo "WARNING: dbpatch-loader does not support stdout mode, working in non-transactional mode" >&2
    echo "HINT: install dbpatch 1.4.0 or higher to fix this." >&2
    ${DBPATCH_LOADER} ${DBPATCH_OPTS} ${PGDATABASE} _patches || exit 1
fi


# Find table_version-loader
TABLEVERSION_LOADER=table_version-loader
which $TABLEVERSION_LOADER > /dev/null || {
    echo "$0 depends on $TABLEVERSION_LOADER, which cannot be found in current PATH." >&2
    echo "Did you install table_version ? (1.4.0 or later needed)" >&2
    exit 1
}

# Check if table_version-loader supports stdout
table_version-loader -  2>&1 | grep -q "database.*does not exist" &&
    TABLEVERSION_SUPPORTS_STDOUT=no ||
    TABLEVERSION_SUPPORTS_STDOUT=yes

if test $PGDATABASE = "-" -a $TABLEVERSION_SUPPORTS_STDOUT != yes; then
    echo "ERROR: table_version-loader does not support stdout mode, cannot proceed" >&2
    echo "HINT: install table_version 1.6.0 or higher to fix this." >&2
    exit 1
fi

TABLEVERSION_OPTS=
if test "${EXTENSION_MODE}" = "off"; then
    TABLEVERSION_OPTS="--no-extension"
fi

if test "${ADD_REVISIONS}" = "yes" -a $TABLEVERSION_SUPPORTS_STDOUT != yes; then
    echo "WARNING: table_version-loader does not support stdout mode, working in non-transactional mode" >&2
    echo "HINT: install table_version 1.6.0 or higher to fix this." >&2
    ${TABLEVERSION_LOADER} ${TABLEVERSION_OPTS} ${PGDATABASE} || exit 1
fi



{



if test $DBPATCH_SUPPORTS_STDOUT = yes; then
    ${DBPATCH_LOADER} ${DBPATCH_OPTS} - _patches || rollback
fi

# Enable table_version if needed
if test "${ADD_REVISIONS}" = "yes" -a $TABLEVERSION_SUPPORTS_STDOUT = yes; then
    ${TABLEVERSION_LOADER} ${TABLEVERSION_OPTS} - || rollback
fi

if test $PGDATABASE != "-"; then
    echo 'SET client_min_messages TO WARNING;'
fi

cat << EOF
CREATE EXTENSION IF NOT EXISTS postgis SCHEMA public;
EOF

for file in ${SCRIPTSDIR}/*.sql; do
    if test ${SKIP_INDEXES} = 'yes' &&
       `basename $file .sql` = '04-bde_schema_index';
    then
        continue
    fi
    cat ${file} || rollback
done

if test "${ADD_REVISIONS}" = "yes"; then
    file=${SCRIPTSDIR}/versioning/01-version_tables.sql
    cat ${file} || rollback
fi

if test "${READ_ONLY}" = "yes"; then
    cat <<EOF
REVOKE UPDATE, INSERT, DELETE, TRUNCATE
    ON ALL TABLES IN SCHEMA bde
    FROM bde_dba, bde_admin, bde_user;
EOF
fi

echo "COMMIT;"

} |
grep -v "^\(BEGIN\|COMMIT\);" |
( echo "BEGIN;"; cat; echo "COMMIT;"; ) |
if test $PGDATABASE = "-"; then
    cat
else
    $PSQL -XtA --set ON_ERROR_STOP=1 -o /dev/null
fi
