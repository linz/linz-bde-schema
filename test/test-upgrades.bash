#!/usr/bin/env bash

set -o errexit -o noclobber -o nounset -o pipefail
shopt -s failglob inherit_errexit

upgradeable_versions="
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

test_database=linz-bde-schema-upgrade-test-db

git fetch --unshallow --tags # to get all commits/tags

tmpdir=/tmp/linz-bde-schema-test-$$
mkdir -p "${tmpdir}"

export PGDATABASE="${test_database}"

for ver in ${upgradeable_versions}
do
    OWD="$PWD"

    dropdb --if-exists "${test_database}"
    createdb "${test_database}"

    psql -XtA <<EOF
CREATE EXTENSION IF NOT EXISTS postgis;
CREATE SCHEMA IF NOT EXISTS _patches;
CREATE EXTENSION IF NOT EXISTS dbpatch SCHEMA _patches;
EOF

    cd "${tmpdir}"
    test -d linz-bde-schema || {
        git clone --quiet --reference "$OWD" \
            https://github.com/linz/linz-bde-schema
    }
    cd linz-bde-schema
    git checkout "${ver}"
    sudo env "PATH=$PATH" make install DESTDIR="$PWD"/inst

    # Install the just-installed linz-bde-schema first !
    for file in inst/usr/share/linz-bde-schema/sql/*.sql \
                 inst/usr/share/linz-bde-schema/sql/versioning/*.sql
    do
        echo "Loading $file from linz-bde-schema ${ver}"
        psql -o /dev/null -XtA -f "$file" ${test_database} --set ON_ERROR_STOP=1
    done

    cd "${OWD}"

# Turn DB to read-only mode, as it would be done
# by linz-bde-schema-load --readonly
    cat <<EOF | psql -Xat ${test_database}
REVOKE UPDATE, INSERT, DELETE, TRUNCATE
    ON ALL TABLES IN SCHEMA bde
    FROM bde_dba, bde_admin, bde_user;
EOF
    pg_prove test/

done
