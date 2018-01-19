#!/usr/bin/env bash
set -euo pipefail
TEST_INPUT=test/test-svn-log.xml
TEST_OUTPUT=test/test-svn-log.csv
TEST_EXPECTED=test/test-svn-log-expected.csv
[[ -f svnlog.xml ]] || svn log --xml --verbose --revision 1820100:1821650 https://svn.apache.org/repos/asf/subversion/trunk/ >$TEST_INPUT

#https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux
#RED='\033[0;31m'
#NC='\033[0m' # No Color
#printf "I ${RED}love${NC} Stack Overflow\n"

#test/svnlog.xml
#test/svnlogExpectedResult.csv

#Check for xsltproc
which xsltproc >/dev/null || ( echo "*** ERROR: 'xsltproc' not found, please install" && exit 1 )

xsltproc transform-svn-log-xml-to-csv.xslt $TEST_INPUT >$TEST_OUTPUT

diff test/test-svn-log.csv test/test-svn-log-expected.csv && echo "*** SUCCES: Output matches expected result"


#cat svn.log | sed -E 's#(^r[0-9]+);([A-Z]{2,3}-[0-9]+)[ -:]*(.+);.*trunk/(.*)$#\1     \2     \3   \4#g'
