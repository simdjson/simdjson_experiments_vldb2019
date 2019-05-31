#!/bin/bash
RESULTSPATH=/results #hardcoded
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
cd $SCRIPTPATH/../../library/simdjson
result=$RESULTSPATH/parselinuxtable.txt
myfile="parselinuxtable_all.txt"
myfilenoutf8validation="parselinuxtable_noutf8validation.txt"
myfilenonumberparsing="parselinuxtable_nonumberparsing.txt"
myfilenostringparsing="parselinuxtable_nostringparsing.txt"
for i in jsonexamples/*.json; do
    [ -f "$i" ] || break
    ./parse -t "$i" >> "$myfile" 
    ./parse_noutf8validation -t "$i" >> "$myfilenoutf8validation"
    ./parse_nonumberparsing -t "$i" >> "$myfilenonumberparsing"
    ./parse_nostringparsing -t "$i" >> "$myfilenostringparsing"
    echo -n "."
done
paste $myfile $myfilenoutf8validation $myfilenonumberparsing $myfilenostringparsing > "$result"
echo
