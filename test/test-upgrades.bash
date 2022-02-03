#!/usr/bin/env bash

set -o errexit -o noclobber -o nounset -o pipefail
shopt -s failglob inherit_errexit

upgradeable_versions=(
    '1.13.0'
    '1.12.2'
    '1.12.1'
    '1.12.0'
    '1.11.0'
    '1.10.3'
    '1.10.2'
    '1.10.1'
    '1.10.0'
    '1.9.0'
    '1.8.0'
    '1.7.0'
    '1.6.1'
    '1.6.0'
    '1.5.0'
    '1.4.0'
    '1.3.0'
    '1.2.1'
    '1.2.0'
    '1.0.1'
    '1.0.0'
)
project_root="$(dirname "$0")/.."

# Install all older versions
trap 'rm -r "$work_directory"' EXIT
work_directory="$(mktemp --directory)"
git clone "$project_root" "$work_directory"

test_database=linz-bde-schema-upgrade-test-db
export PGDATABASE="${test_database}"

for version in "${upgradeable_versions[@]}"
do
    dropdb --if-exists "${test_database}"
    createdb "${test_database}"

    psql -XtA <<EOF
CREATE EXTENSION IF NOT EXISTS postgis;
CREATE SCHEMA IF NOT EXISTS _patches;
CREATE EXTENSION IF NOT EXISTS dbpatch SCHEMA _patches;
EOF

    echo "-------------------------------------"
    echo "Installing version $version"
    echo "-------------------------------------"
    git -C "$work_directory" clean -dx --force
    git -C "$work_directory" checkout "$version"
    sudo env "PATH=$PATH" make --directory="$work_directory" install DESTDIR="$PWD"/inst

    # Install the just-installed linz-bde-schema first !
    for file in inst/usr/share/linz-bde-schema/sql/*.sql \
                 inst/usr/share/linz-bde-schema/sql/versioning/*.sql
    do
        echo "Loading $file from linz-bde-schema ${version}"
        psql -o /dev/null -XtA -f "$file" ${test_database} --set ON_ERROR_STOP=1
    done

# Turn DB to read-only mode, as it would be done
# by linz-bde-schema-load --readonly
    cat <<EOF | psql -Xat ${test_database}
REVOKE UPDATE, INSERT, DELETE, TRUNCATE
    ON ALL TABLES IN SCHEMA bde
    FROM bde_dba, bde_admin, bde_user;
EOF
    pg_prove test/

done
