#!/usr/bin/env python
import os

from collections import OrderedDict

sizes= {"apache_builds": [94653 ,127275], "canada": [2251027, 2251027],"citm_catalog": [500299, 1727204], "github_events": [53329, 65132],"gsoc-2018": [3073766, 3327831], "instruments": [108313, 220346],"marine_ik": [1834197, 2983466], "mesh":  [650573, 723597], "mesh.pretty": [753399,  1577353], "numbers": [150121, 150124], "random": [461466, 510476], "twitterescaped": [562408, 562408], "twitter": [466906 , 631514], "update-center": [533177 , 533178]}

import csv
import sys
import os
dir = ""
if len(sys.argv) > 1 :
    dir = sys.argv[1]
def load(f):
    result = OrderedDict()
    with open(dir +os.sep + f) as csv_file:
      csv_reader = csv.reader(csv_file, delimiter=' ', skipinitialspace=True)

      line_count = 0
      for row in csv_reader:
        if line_count == 0:
            columns = row
            line_count += 1
        else:
            resultsdict = OrderedDict()
            for i in range(1,len(columns)):
                if(len(row[i]) == 0) : continue
                resultsdict[columns[i]] = float(row[i])
            result[row[0]] = resultsdict

            line_count += 1
    return result

k = list(sizes.keys())
k.sort()
print("                                                 original   minified")
for name in k:
    if(sizes[name][0] * 1.01 >= sizes[name][1]): continue
    print(name)
    base = load(name+".table")
    mini = load(name+".mini.table")
    for parser in base.keys():
        cyclesbase = base[parser]["cycles_per_byte"] * sizes[name][1]
        cyclesmini = mini[parser]["cycles_per_byte"] * sizes[name][0]
        million = 1000000
        print(" %s  (%.0f) :   %5.2f %5.2f  (%.0f)" %(parser, sizes[name][0] / sizes[name][1] * 100,  cyclesbase / million, cyclesmini / million, (cyclesmini/cyclesbase)*100))
    print()
