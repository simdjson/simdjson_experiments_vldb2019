#!/bin/bash
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
ROOTPATH=$SCRIPTPATH/../..
#set -o xtrace

for dir in $ROOTPATH/results/* ; do
echo $dir
if [[ -d $dir ]]; then
  echo $(basename $dir);
  myfile=$dir/stacked_plot/parselinuxtable.txt 
  plotdirectory=$SCRIPTPATH/$(basename $dir)
  mkdir -p $plotdirectory
  echo "printing data from "$myfile
  gnuplot -e "filename='$myfile';name='$plotdirectory/stackedperf.pdf'" $SCRIPTPATH/stackbar.gnuplot
  echo $plotdirectory/stackedperf.pdf
fi 
done