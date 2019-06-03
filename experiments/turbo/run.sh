#!/bin/bash
RESULTSPATH=/results #hardcoded
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
cd $SCRIPTPATH
./avx-turbo/avx-turbo  > $RESULTSPATH/turbodata.txt
