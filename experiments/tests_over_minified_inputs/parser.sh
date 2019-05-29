#!/bin/bash
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
cd $SCRIPTPATH/../../library/simdjson
echo 
for i in jsonexamples/*.json; do
    [ -f "$i" ] || break
    echo $i
    ./parsingcompetition    $i
    echo "# minifying"
    ./minify $i > $i.minified
    echo $i.minified
    ./parsingcompetition  $i.minified
    echo
    echo
done
