import re
import sys
import os
ourdir = sys.argv[1]
ourfiles = []
for file in os.listdir(ourdir):
    if not(file.startswith("detailed")):
        continue
    ourfiles.append(file)
ourfiles.sort()
averages =[0,0,0]
mean=[1,1]
for file in ourfiles:
    total = ""
    arr = []
    for line in open(ourdir+os.sep+file):
      m = re.findall("insperbyte\\s+(\\d+\\.\\d*)",line)
      if(len(m) == 0):
          continue
      arr.append(float(m[0]))
      total += m[0] +"\t&\t"
    ratios = [arr[1]/arr[0], arr[2]/arr[0]]
    mean[0] *= arr[1]/arr[0]
    mean[1] *= arr[2]/arr[0]
    for i in range(3):
        averages[i] += arr[i]
    name = file[8:-6]
    print (name+"\t&\t"+total+"\t&\t".join("{0:0.1f}".format(i) for i in ratios)+"\\\\")
for i in range(3):
    averages[i] /= len(ourfiles)
mean[0] = pow(mean[0],1/len(ourfiles))
mean[1] = pow(mean[1],1/len(ourfiles))
print("\t&\t".join("{0:0.1f}".format(i) for i in averages))
print("\t&\t".join("{0:0.1f}".format(i) for i in mean))
