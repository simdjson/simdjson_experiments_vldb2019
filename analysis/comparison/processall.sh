#!/bin/bash
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
ROOTPATH=$SCRIPTPATH/../..
#set -o xtrace

for dir in $ROOTPATH/results/* ; do
echo $dir
if [[ -d $dir ]]; then
  echo $(basename $dir);
  mydir=$dir/comparison/
  myfile=$(mktemp)
  python allpasteandrotate.py $mydir 
fi
done
