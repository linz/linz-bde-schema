#!/usr/bin/env bash

set -o errexit -o noclobber -o nounset -o pipefail
shopt -s failglob inherit_errexit

#
# Generate table comments from DataDictionary XML
# See
# https://github.com/linz/linz-bde-schema/issues/54#issuecomment-347681119
#

test -n "$1" || {
    echo "Usage: $0 <DataDictionary.xml> [<schema.sql>] [<skipcomments.sql>]" >&2 && exit 1;
}

source="$1"
DDL="$2"
SKIP_COMMENTS="$3"

echo "-- Generated by $0 on $(date)"
echo "-- From input: $source"

xsltproc /dev/stdin "$source" << EOF | \
perl -e '
my $state=0;
my $use=1;
my %tables;
my %nocomment;
my $ddl = shift;
my $skip_comments = shift;

if ( $ddl ) {
    print "-- Filtered by DDL: $ddl\n";
    open(DDL, "<$ddl") || die "Cannot open $ddl for reading\n";
    while(<DDL>)
    {
        if ( /CREATE TABLE (.*) \(/ )
        {
            my $table = lc($1);
            $table =~ s/^.*\.//;
            $table =~ s/ *$//; # rtrim
            #print "-- Found table: [$table]\n";
            $tables{$table} = 1;
        }
    }
}
if ( $skip_comments ) {
    print "-- Skipping comments in: $skip_comments\n";
    open(SKIP, "<$skip_comments") || die "Cannot open $skip_comments for reading\n";
    while(<SKIP>)
    {
        if ( /COMMENT ON TABLE (.*) IS / )
        {
            my $table = lc($1);
            $table =~ s/^.*\.//;
            #print "-- Found comment for: [$table]\n";
            $nocomment{$table} = 1;
        }
    }
}
while(<>) { # process output from xsltproc
    if ( $state == 0 && /^-- START TABLE (.*)/ )
    {
        my $table = lc($1);
        $use = $tables{$table} ? 1 : $ddl ? 0 : 1;
        $state = 1;
        $use = 0 if $nocomment{$table};
        #print "-- USE table [$table] ? $use\n";
    }
    if ( $use )
    {
        print
    }
    if ( $state == 1 && /^-- END TABLE/ )
    {
        $state = 0;
    }
}
' "$DDL" "$SKIP_COMMENTS"

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="text"/>
  <xsl:template match="entity-list">
    <xsl:for-each select="entity">
      <xsl:if test="contains(code, 'CRS_')">
-- START TABLE <xsl:value-of select="code"/>
COMMENT ON TABLE bde.<xsl:value-of select="code"/> IS \$DESC\$
<xsl:value-of select="description"/>
\$DESC\$;
-- END TABLE
</xsl:if>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
EOF
