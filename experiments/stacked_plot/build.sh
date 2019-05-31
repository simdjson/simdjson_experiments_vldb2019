#!/bin/bash
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
cd $SCRIPTPATH/../../library/simdjson
make -k parse parse_noutf8validation parse_nonumberparsing parse_nostringparsing 
