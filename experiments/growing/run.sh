#!/bin/bash
RESULTSPATH=/results #hardcoded
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
cd $SCRIPTPATH/../../library/simdjson
cat /dev/null >  $RESULTSPATH/growing.txt
for i in (1..1000); do
    filename = "deleteme.json"
    python gen.py $i > $filename
    SIZE=`du -k "$filename" | cut -f1`
    SPEED=`./parse -t jsonexamples/twitter.json |  awk '{print $6}'`
    echo $SIZE" "$SPEED >>  $RESULTSPATH/growing.txt
    echo -n "."
done
echo
