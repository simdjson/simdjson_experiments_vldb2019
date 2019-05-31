#!/bin/bash
RESULTSPATH=/results #hardcoded
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
cd $SCRIPTPATH/../../library/simdjson
result=$RESULTSPATH/modeltable.txt
echo "" > $result
for i in jsonexamples/*.json; do
    [ -f "$i" ] || break
    echo "#"$i >> $result
    ./statisticalmodel $i >> $result
    echo -n "."
done
echo
