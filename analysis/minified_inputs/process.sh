#!/bin/bash
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
ROOTPATH=$SCRIPTPATH/../..


for dir in $ROOTPATH/results/* ; do
echo $dir
if [[ -d $dir ]]; then
  echo $(basename $dir);
  $SCRIPTPATH/compute.py $dir/minified_inputs 
fi 
done