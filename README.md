LINZ BDE SCHEMAS
================

Provides the core BDE schemas and functions that are used for storing
and accessing raw BDE exports from the Landonline database system.

Installation
------------

First install the project into the OS data share directory:

```shell
sudo make install
```

Then you need to install the PostGIS and dbpatch extensions:

```shell
createdb $DB_NAME
psql $DB_NAME -c "CREATE EXTENSION postgis"
psql $DB_NAME -c "CREATE SCHEMA _patches"
psql $DB_NAME -c "CREATE EXTENSION dbpatch SCHEMA _patches"
```

You can then execute the installed SQL files with something like:

```shell
for file in /usr/share/linz-bde-schema/sql/*.sql
    do psql $DB_NAME -f $file -v ON_ERROR_STOP=1
done
```

or the following commands if you don't want to install the indexes:

```shell
psql $DB_NAME -f /usr/share/linz-bde-schema/sql/01-bde_roles.sql
psql $DB_NAME -f /usr/share/linz-bde-schema/sql/02-bde_schema.sql
psql $DB_NAME -f /usr/share/linz-bde-schema/sql/03-bde_functions.sql
psql $DB_NAME -f /usr/share/linz-bde-schema/sql/05-bde_version.sql
psql $DB_NAME -f /usr/share/linz-bde-schema/sql/99-patches.sql
```

If you would like to revision the table then install the table_version extension
and then run the versioning SQL script:

```shell
psql $DB_NAME -c "CREATE EXTENSION table_version"
psql $DB_NAME -f /usr/share/linz-bde-schema/sql/versioning/01-version_tables.sql
```

Testing
-------

Testing is done using pg_regress and PgTap. To run the tests run the following command:

```shell
make test
```

Building Debian packaging
--------------------------

Build the debian packages using the following command:

```shell
dpkg-buildpackage -us -uc
```

Dependencies
------------

Requires PostgreSQL 9.3+/PostGIS 2.2+, PL/PgSQL, [dbpatch](https://github.com/linz/postgresql-dbpatch) and (optionally)
[table_version](https://github.com/linz/postgresql-tableversion) extensions installed.

License
---------------------
This project is under 3-clause BSD License, except where otherwise specified.
See the LICENSE file for more details.
