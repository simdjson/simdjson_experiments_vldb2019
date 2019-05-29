#!/bin/bash
IMAGENAME=tests_over_minified_inputs #hardcoded
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
ROOTPATH=$SCRIPTPATH/../..
SIMDJSONPATH=$ROOTPATH/library/simdjson

RESULTSPATH=$SCRIPTPATH/results/$(uname -n)
mkdir -p $RESULTSPATH
cd $ROOT
for i in $SIMDJSONPATH/jsonexamples/*.json; do
    [ -f "$i" ] || break
    echo -n "."
    filetable=$(basename $i.table)
    minifiletable=$(basename $i.mini.table)
    docker run -t $IMAGENAME cat /usr/src/library/simdjson/$filetable > $RESULTSPATH/$filetable
    docker run -t $IMAGENAME cat /usr/src/library/simdjson/$minifiletable > $RESULTSPATH/$minifiletable
done
echo
echo "results are in $RESULTSPATH"
