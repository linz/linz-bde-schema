#!/bin/sh

UPGRADEABLE_VERSIONS="
    1.3.0
    1.2.1
    1.2.0
"

TEST_DATABASE=linz-bde-schema-upgrade-test-db

export PGDATABASE=${TEST_DATABASE}

for ver in ${UPGRADEABLE_VERSIONS}; do
    OWD=$PWD

    dropdb --if-exists ${TEST_DATABASE}
    createdb ${TEST_DATABASE} || exit 1

    psql -XtA <<EOF
CREATE EXTENSION IF NOT EXISTS postgis;
CREATE SCHEMA IF NOT EXISTS _patches;
CREATE EXTENSION IF NOT EXISTS dbpatch SCHEMA _patches;
EOF

    cd /tmp
    wget -q -O - \
        https://github.com/linz/linz-bde-schema/archive/${ver}.tar.gz \
        | tar xzf - && cd linz-bde-schema-${ver} || exit 1
    sudo env "PATH=$PATH" make install DESTDIR=$PWD/inst || exit 1

    # Install the just-installed linz-bde-schema first !
    for file in inst/usr/share/linz-bde-schema/sql/*.sql \
                 inst/usr/share/linz-bde-schema/sql/versioning/*.sql
    do
        echo "Loading $file from linz-bde-schema ${ver}"
        psql -o /dev/null -XtA -f $file ${TEST_DATABASE} --set ON_ERROR_STOP=1 || exit 1
    done

    cd ${OWD}

    pg_prove test/ || exit 1

done
