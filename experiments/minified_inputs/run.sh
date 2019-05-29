#!/bin/bash
RESULTSPATH=/results #hardcoded
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
cd $SCRIPTPATH/../../library/simdjson
echo
for i in jsonexamples/*.json; do
    [ -f "$i" ] || break
    result=$(basename $i .json)".table"
    ./parsingcompetition -t $i > $RESULTSPATH/$result
    echo -n "."
    mininame=$(basename $i .json)".mini.json"
    miniresult=$(basename $i .json)".mini.table"
    ./minify $i > $mininame
    ./parsingcompetition -t  $i.minified > $RESULTSPATH/$miniresult
    echo -n "."
done
echo
