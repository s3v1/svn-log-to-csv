#!/usr/bin/env bash
set -euo pipefail

which xsltproc || ( echo "*** ERROR: 'xsltproc' not found, please install" && exit 1 )
xsltproc transform_svn_log.xslt svnlog.xml >svn-log.csv
cat svn-log.csv