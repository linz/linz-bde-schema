# Writing tests

Tests are written using the [PgTap](http://pgtap.org/) extension
and run by the PostgreSQL `pg_regress` utility.

The test sources are under `sql/` directory. At the time of
writing this document there's a single test source `base.sql`
which is referenced by the `check` rule of the top-level
`Makefile` .

When adding tests to a test source (ie: `base.sql`), running
`make check` will fail until you also update the corresponding
expected output under `expect` (ie: `base.out`). The actual
obtained output will be left in the top-level `results` directory
so you can (from top-level directory) run the following command
to update the expected output:

   cp results/base.out test/expected/base.out

Please make sure not to expect wrong output !

Refer to the PgTap documentation for more info about writing tests:

  http://pgtap.org/documentation.html
