#!/bin/bash
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
cd $SCRIPTPATH/../../library/simdjson
make -k parsingcompetition minify 
echo 
for i in jsonexamples/*.json; do
    [ -f "$i" ] || break
    result=$(basename $i.table)
    ./parsingcompetition -t $i > $result 
    echo -n "."
    mininame=$(basename $i.mini.json)
    miniresult=$(basename $i.mini.table)
    ./minify $i > $mininame
    ./parsingcompetition -t  $i.minified > $miniresult
    echo -n "."
done
echo
