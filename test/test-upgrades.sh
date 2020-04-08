#!/bin/sh

UPGRADEABLE_VERSIONS="
    1.9.0
    1.8.0
    1.7.0
    1.6.1
    1.6.0
    1.5.0
    1.4.0
    1.3.0
    1.2.1
    1.2.0
    1.0.1
    1.0.0
"

TEST_DATABASE=linz-bde-schema-upgrade-test-db

git fetch --unshallow --tags # to get all commits/tags

TMPDIR=/tmp/linz-bde-schema-test-$$
mkdir -p ${TMPDIR}

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

    cd ${TMPDIR}
    test -d linz-bde-schema || {
        git clone --quiet --reference $OWD \
            https://github.com/linz/linz-bde-schema || exit 1
    }
    cd linz-bde-schema || exit 1
    git checkout ${ver} || exit 1
    sudo env "PATH=$PATH" make install DESTDIR=$PWD/inst || exit 1

    # Install the just-installed linz-bde-schema first !
    for file in inst/usr/share/linz-bde-schema/sql/*.sql \
                 inst/usr/share/linz-bde-schema/sql/versioning/*.sql
    do
        echo "Loading $file from linz-bde-schema ${ver}"
        psql -o /dev/null -XtA -f $file ${TEST_DATABASE} --set ON_ERROR_STOP=1 || exit 1
    done

    cd ${OWD}

# Turn DB to read-only mode, as it would be done
# by linz-bde-schema-load --readonly
    cat <<EOF | psql -Xat ${TEST_DATABASE}
REVOKE UPDATE, INSERT, DELETE, TRUNCATE
    ON ALL TABLES IN SCHEMA bde
    FROM bde_dba, bde_admin, bde_user;
EOF
    pg_prove test/ || exit 1

done
