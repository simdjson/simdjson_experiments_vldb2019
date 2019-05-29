#!/usr/bin/env python
# https://unix.stackexchange.com/questions/33450/checking-if-hyperthreading-is-enabled-or-not

import re
import sys

total_logical_cpus = 0
total_physical_cpus = 0
total_cores = 0

logical_cpus = {}
physical_cpus = {}
cores = {}

hyperthreading = False

for line in open('/proc/cpuinfo').readlines():
    if re.match('processor', line):
        cpu = int(line.split()[2])

        if cpu not in logical_cpus:
            logical_cpus[cpu] = []
            total_logical_cpus += 1

    if re.match('physical id', line):
        phys_id = int(line.split()[3])

        if phys_id not in physical_cpus:
            physical_cpus[phys_id] = []
            total_physical_cpus += 1

    if re.match('core id', line):
        core = int(line.split()[3])

        if core not in cores:
            cores[core] = []
            total_cores += 1

        cores[core].append(cpu)

if (total_cores * total_physical_cpus) * 2 == total_logical_cpus:
    hyperthreading = True

print("  This system has %d physical CPUs" % total_physical_cpus)
print("  This system has %d cores per physical CPU" % total_cores)
print("  This system has %d total cores" % (total_cores * total_physical_cpus))
print("  This system has %d logical CPUs" % total_logical_cpus)

if hyperthreading:
    print("  HT detected, if you want to disable it:")
    print("  Edit your grub config and add 'noht'")
    print("  -OR- disable hyperthreading in the BIOS")
    print("  -OR- try the following to offline those CPUs:")

    for c in cores:
        for p, val in enumerate(cores[c]):
            if p > 0:
                print("    echo 0 > /sys/devices/system/cpu/cpu%d/online" % (val))
    sys.exit(1)
sys.exit(0)
