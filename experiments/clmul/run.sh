#!/bin/bash
RESULTSPATH=/results #hardcoded
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
cd $SCRIPTPATH/../../library/simdjson
fastresult=$RESULTSPATH/fastclmul.txt
slowresult=$RESULTSPATH/slowclmul.txt
echo -n "" > $fastresult
echo -n "" > $slowresult
for i in jsonexamples/*.json; do
    [ -f "$i" ] || break
    echo "#"$i >> $fastresult
    ./fastparse -t $i >> $fastresult
    echo "#"$i >> $slowresult
    ./slowparse -t $i >> $slowresult
    echo -n "."
done
echo
