#!/bin/bash
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
cd $SCRIPTPATH/../../library/simdjson
make -k parsingcompetition minify jsonstats
echo 
for i in jsonexamples/*.json; do
    [ -f "$i" ] || break
    echo -n "#"
    echo $i
    echo -n "#"
    ./jsonstats $i
    ./parsingcompetition    $i
    ./parsingcompetition -t 
    echo "# minifying"
    ./minify $i > $i.minified
    echo -n "#"
    echo $i.minified
    echo -n "#"
    ./jsonstats $i.minified
    ./parsingcompetition  $i.minified
    ./parsingcompetition -t  $i.minified
     echo
    echo "# ========"
    echo
done
