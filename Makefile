# Minimal script to install the SQL creation scripts ready for postinst script.

VERSION=1.14.0
REVISION = $(shell test -d .git && git describe --always || echo $(VERSION))

TEST_DATABASE = regress_linz_bde_schema

datadir=${DESTDIR}/usr/share/linz-bde-schema
bindir=${DESTDIR}/usr/bin

#
# Uncoment these line to support testing via pg_regress
#

SQLSCRIPTS = \
  sql/01-bde_roles.sql \
  sql/02-bde_schema.sql \
  sql/03-bde_functions.sql \
  sql/04-bde_schema_index.sql \
  sql/05-bde_version.sql \
  sql/99-patches.sql \
  sql/versioning/01-version_tables.sql

SCRIPTS_built = \
    scripts/linz-bde-schema-load \
    scripts/linz-bde-schema-publish

TEST_SCRIPTS = \
    test/base.pg

EXTRA_CLEAN = \
    sql/05-bde_version.sql \
    sql/03-bde_functions.sql \
    $(SCRIPTS_built)

.dummy:

# Need install to depend on something for debuild

all: $(SQLSCRIPTS) $(SCRIPTS_built)

%.sql: %.sql.in Makefile
	sed -e 's/@@VERSION@@/$(VERSION)/;s|@@REVISION@@|$(REVISION)|' $< > $@

scripts/linz-bde-schema-load: scripts/linz-bde-schema-load.bash
	sed -e 's/@@VERSION@@/$(VERSION)/;s|@@REVISION@@|$(REVISION)|' $< > $@
	chmod +x $@

scripts/linz-bde-schema-publish: scripts/linz-bde-schema-publish.bash
	sed -e 's/@@VERSION@@/$(VERSION)/;s|@@REVISION@@|$(REVISION)|' $< > $@
	chmod +x $@

install: $(SQLSCRIPTS) $(SCRIPTS_built)
	mkdir -p ${datadir}/sql
	cp sql/*.sql ${datadir}/sql
	mkdir -p ${datadir}/sql/versioning
	cp sql/versioning/*.sql ${datadir}/sql/versioning
	mkdir -p ${bindir}
	cp $(SCRIPTS_built) ${bindir}

installcheck: check-loader

# Check an already prepared database
# It is expected that the prepared database
# is set via PGDATABASE
#
check-prepared:
	V=`psql -XtAc 'select bde.bde_version()'` && \
	echo $$V && test "$$V" = "$(VERSION)"
	mkdir -p test-prepared/ && \
	sed '/\\i sql/d' test/base.pg | \
	sed '/-- Switch to unprivileged role/,/^END /d' | \
	sed '/-- Cleanup/,/^END /d' \
	> test-prepared/base.pg && \
	pg_prove test-prepared/

check-publisher:
	V=`linz-bde-schema-publish --version` && \
	echo $$V && test `echo "$$V" | awk '{print $$1}'` = "$(VERSION)"

	test/test-publication.bash

check-loader:

	V=`linz-bde-schema-load --version` && \
	echo $$V && test `echo "$$V" | awk '{print $$1}'` = "$(VERSION)"

	dropdb --if-exists $(TEST_DATABASE)

	createdb $(TEST_DATABASE)
	linz-bde-schema-load $(TEST_DATABASE)
	linz-bde-schema-load $(TEST_DATABASE)
	export PGDATABASE=$(TEST_DATABASE); \
	$(MAKE) check-prepared
	dropdb $(TEST_DATABASE)

	createdb $(TEST_DATABASE)
	linz-bde-schema-load --noextension $(TEST_DATABASE)
	linz-bde-schema-load --noextension $(TEST_DATABASE)
	export PGDATABASE=$(TEST_DATABASE); \
	$(MAKE) check-prepared
	dropdb $(TEST_DATABASE)

	createdb $(TEST_DATABASE)
	linz-bde-schema-load --revision $(TEST_DATABASE)
	linz-bde-schema-load --revision $(TEST_DATABASE)
	export PGDATABASE=$(TEST_DATABASE); \
	$(MAKE) check-prepared
	dropdb $(TEST_DATABASE)

check-loader-stdout:

	dropdb --if-exists $(TEST_DATABASE)

	createdb $(TEST_DATABASE)
	linz-bde-schema-load - | \
        psql --set ON_ERROR_STOP=1 -Xo /dev/null $(TEST_DATABASE)
	linz-bde-schema-load - | \
        psql --set ON_ERROR_STOP=1 -Xo /dev/null $(TEST_DATABASE)
	export PGDATABASE=$(TEST_DATABASE); \
	$(MAKE) check-prepared
	dropdb $(TEST_DATABASE)

	createdb $(TEST_DATABASE)
	linz-bde-schema-load --noextension - | \
        psql --set ON_ERROR_STOP=1 -Xo /dev/null $(TEST_DATABASE)
	linz-bde-schema-load --noextension - | \
        psql --set ON_ERROR_STOP=1 -Xo /dev/null $(TEST_DATABASE)
	export PGDATABASE=$(TEST_DATABASE); \
	$(MAKE) check-prepared
	dropdb $(TEST_DATABASE)

	createdb $(TEST_DATABASE)
	linz-bde-schema-load --revision - | \
        psql --set ON_ERROR_STOP=1 -Xo /dev/null $(TEST_DATABASE)
	linz-bde-schema-load --revision - | \
        psql --set ON_ERROR_STOP=1 -Xo /dev/null $(TEST_DATABASE)
	export PGDATABASE=$(TEST_DATABASE); \
	$(MAKE) check-prepared
	dropdb $(TEST_DATABASE)

uninstall:
	rm -rf ${datadir}

check test: $(SQLSCRIPTS) $(TEST_SCRIPTS)
	export PGDATABASE=$(TEST_DATABASE); \
	dropdb --if-exists $$PGDATABASE; \
	createdb $$PGDATABASE; \
	pg_prove test/;
	# Test with versioning after patches
	export PGDATABASE=$(TEST_DATABASE); \
	dropdb --if-exists $$PGDATABASE && \
	createdb $$PGDATABASE && \
	mkdir -p test-versioned/ && \
	sed 's/^--VERSIONED-- //' test/base.pg > test-versioned/base.pg && \
	table_version-loader $$PGDATABASE && \
	pg_prove test-versioned/
	# Test with versioning after patches and table_version
	# installed NOT as an extension
	export PGDATABASE=$(TEST_DATABASE); \
	dropdb --if-exists $$PGDATABASE && \
	createdb $$PGDATABASE && \
	mkdir -p test-versioned/ && \
	sed 's/^--VERSIONED-- //' test/base.pg > test-versioned/base.pg && \
	table_version-loader --no-extension $$PGDATABASE && \
	pg_prove test-versioned/
	# Test with versioning before patches (the sed line swaps
	# order of 99-patches.sql and version_tables.sql files)
	export PGDATABASE=$(TEST_DATABASE); \
	dropdb --if-exists $$PGDATABASE && \
	createdb $$PGDATABASE && \
	mkdir -p test-versioned/ && \
	sed 's/^--VERSIONED-- //' test/base.pg | \
        sed -n '/99-patches/ { h; :a; n; /version_tables.sql/ { p; x } }; p' \
        > test-versioned/base.pg && \
	table_version-loader $$PGDATABASE && \
	pg_prove test-versioned/
	# Test with versioning before patches and table_version
	# installed NOT as an extension
	export PGDATABASE=$(TEST_DATABASE); \
	dropdb --if-exists $$PGDATABASE && \
	createdb $$PGDATABASE && \
	mkdir -p test-versioned/ && \
	sed 's/^--VERSIONED-- //' test/base.pg | \
        sed -n '/99-patches/ { h; :a; n; /version_tables.sql/ { p; x } }; p' \
        > test-versioned/base.pg && \
	table_version-loader --no-extension $$PGDATABASE && \
	pg_prove test-versioned/

clean:
	rm -f regression.diffs
	rm -f regression.out
	rm -rf results
	rm -f $(EXTRA_CLEAN)
