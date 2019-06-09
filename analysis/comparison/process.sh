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
  python pasteandrotate.py $mydir > $myfile
  plotdirectory=$SCRIPTPATH/$(basename $dir)
  mkdir -p $plotdirectory
  echo "printing data from "$myfile
  gnuplot -e "filename='$myfile';name='$plotdirectory/gbps.pdf'" $SCRIPTPATH/bar.gnuplot && rm $myfile
  echo $plotdirectory/gbps.pdf
fi 
done
