#!/bin/bash
RESULTSPATH=/results #hardcoded
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
cd $SCRIPTPATH/../../library/simdjson
./distinctuseridcompetition -t jsonexamples/twitter.json > $RESULTSPATH/distinctuseridcompetition.txt
