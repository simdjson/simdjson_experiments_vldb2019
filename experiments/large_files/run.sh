#!/bin/bash
RESULTSPATH=/results #hardcoded
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
cd $SCRIPTPATH/../../library/simdjson
./parsingcompetition -t $SCRIPTPATH/refsnp-unsupported35000.json > $RESULTSPATH/refsnp-unsupported35000.table
