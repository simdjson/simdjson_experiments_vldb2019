#!/bin/bash
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
ROOTPATH=$SCRIPTPATH/../..
#set -o xtrace

for dir in $ROOTPATH/results/* ; do
echo $dir
if [[ -d $dir ]]; then
  echo $(basename $dir);
  mydir=$dir/growing/
  plotdirectory=$SCRIPTPATH/$(basename $dir)
  mkdir -p $plotdirectory
  myfile=$mydir/growing.txt
  echo "printing data from "$myfile
  gnuplot -e "filename='$myfile';name='$plotdirectory/growing.pdf'" $SCRIPTPATH/growing.gnuplot
  echo $plotdirectory/growing.pdf
fi
done
