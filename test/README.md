# Writing tests

Tests are written using the [PgTap](http://pgtap.org/) extension
and run by PgTap's `pg_prove` utility.

The test sources are under in files with `.pg` suffix. At the time of
writing this document there's a single test source `base.pg`
which is referenced by the `check` rule of the top-level
`Makefile` .

When adding tests to a test source (ie: `base.pg`), run
`make check` to verify it passes.

Refer to the PgTap documentation for more info about writing tests:

  http://pgtap.org/documentation.html
