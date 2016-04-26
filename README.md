LINZ BDE SCHEMAS
=================================

Provides that core BDE schemas and functions that are used for storing and accessing raw BDE
unloads from the Landonline database system.

Installation
------------

    sudo make install
    
You can then execute the installed SQL file with something like:
    
    for file in /usr/share/linz-bde-schema/*.sql
        do psql $DATABASE_NAME -f $file
    done

Testing
-------

Testing is done using pg_regress and PgTap. To run the tests run the following command:

	make test

Building Debian packaging
--------------------------

Build the debian packages using the following command:

    dpkg-buildpackage -us -uc


Dependencies
------------

Requires PostgreSQL 9.3+/PostGIS 2.2+ and the PL/PgSQL language extension installed.
Also requires the BDE schemas to be installed which are part of the
https://github.com/linz/linz-bde-schema project

License
---------------------
This project is under 3-clause BSD License, except where otherwise specified.
See the LICENSE file for more details.