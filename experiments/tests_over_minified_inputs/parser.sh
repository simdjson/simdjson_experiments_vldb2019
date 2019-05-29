#!/bin/bash
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
cd $SCRIPTPATH/../../library/simdjson
make parsingcompetition minify jsonstats
echo 
for i in jsonexamples/*.json; do
    [ -f "$i" ] || break
    echo -n "#"
    echo $i
    echo -n "#"
    ./jsonstats $i
    ./parsingcompetition  -t  $i
    echo "# minifying"
    ./minify $i > $i.minified
    echo -n "#"
    echo $i.minified
    echo -n "#"
    ./jsonstats $i.minified
    ./parsingcompetition -t $i.minified
    echo
    echo "# ========"
    echo
done
