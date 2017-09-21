# Minimal script to install the SQL creation scripts ready for postinst script.

VERSION=1.1.0dev
REVISION = $(shell test -d .git && git describe --always || echo $(VERSION))

SED = sed

datadir=${DESTDIR}/usr/share/linz-bde-schema
bindir=${DESTDIR}/usr/local/bin

#
# Uncoment these line to support testing via pg_regress
#

PG_CONFIG    = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
PG_REGRESS := $(dir $(PGXS))../../src/test/regress/pg_regress

SQLSCRIPTS = \
  sql/01-bde_roles.sql \
  sql/02-bde_schema.sql \
  sql/03-bde_functions.sql \
  sql/04-bde_schema_index.sql \
  sql/05-bde_version.sql \
  sql/99-patches.sql \
  sql/versioning/01-version_tables.sql
  $(END)

SCRIPTS = \
    scripts/linz-bde-schema-load \
    $(END)

EXTRA_CLEAN = sql/05-bde_version.sql sql/03-bde_functions.sql

.dummy:

# Need install to depend on something for debuild

all: $(SQLSCRIPTS)

%.sql: %.sql.in Makefile
	$(SED) -e 's/@@VERSION@@/$(VERSION)/;s/@@REVISION@@/$(REVISION)/' $< > $@

install: $(SQLSCRIPTS)
	mkdir -p ${datadir}/sql
	cp sql/*.sql ${datadir}/sql
	mkdir -p ${datadir}/sql/versioning
	cp sql/versioning/*.sql ${datadir}/sql/versioning
	mkdir -p ${bindir}
	cp $(SCRIPTS) ${bindir}

uninstall:
	rm -rf ${datadir}

check test: $(SQLSCRIPTS)
	${PG_REGRESS} \
   --inputdir=./ \
   --inputdir=test \
   --load-language=plpgsql \
   --dbname=regression base

clean:
	rm -f regression.diffs
	rm -f regression.out
	rm -rf results
	rm -f $(EXTRA_CLEAN)

