[![Build Status](https://secure.travis-ci.org/linz/linz-bde-schema.svg)](http://travis-ci.org/linz/linz-bde-schema)

LINZ BDE SCHEMAS
================

Provides the core BDE schemas and functions that are used for storing
and accessing raw BDE exports from the Landonline database system.

Refer to [LINZ::Bde](https://github.com/linz/linz_bde_perl)
documentation for further information about raw BDE exports format.

Installation
------------

First install the project into the OS data share directory:

```shell
sudo make install
```

Then you can load the schema into a target database

```shell
linz-bde-schema-load $DB_NAME
```

If you don't want to install the indexes, add `--noindexes
to the `linz-bde-schema-load` invocation:

```shell
linz-bde-schema-load --noindexes $DB_NAME
```

If you would like to revision the table, add `--revision`
to the `linz-bde-schema-load` invocation:

```shell
linz-bde-schema-load --noindexes --revision $DB_NAME
```

Add `--noextension` switch if required extensions are
not available on the database system.

NOTE: the loader script will expect to find SQL scripts
      under `/usr/share/linz-bde-schema/sql`, if you want
      them found in a different directory you can set the
      ``BDESCHEMA_SQLDIR`` environment variable.


Upgrade
-------

You can upgrade the schema in an existing database by following
the install procedure. The `linz-bde-schema-load` script is able
to both install or upgrade databases.

Testing
-------

Testing is done using `pg_regress` and `PgTap`.
To run the tests run the following command:

```shell
make check
```

Building Debian packaging
--------------------------

Build the debian packages using the following command:

```shell
dpkg-buildpackage -us -uc
```

Dependencies
------------

Requires PostgreSQL 9.3+/PostGIS 2.2+, PL/PgSQL,
[dbpatch](https://github.com/linz/postgresql-dbpatch) and (optionally)
[table_version](https://github.com/linz/postgresql-tableversion) extensions
installed.

License
---------------------
This project is under 3-clause BSD License, except where otherwise specified.
See the LICENSE file for more details.
