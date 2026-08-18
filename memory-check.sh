#!/bin/bash

# get the latest memory usage
MEMTOTAL=$(grep "MemTotal" /proc/meminfo | awk '{print $2}')
MEMFREE=$(grep "MemFree" /proc/meminfo | awk '{print $2}')
MEMAVAILABLE=$(grep "MemAvailable" /proc/meminfo | awk '{print $2}')


echo "MemTotal: $MEMTOTAL"
echo "MemFree: $MEMFREE"
echo "MemAvailable: $MEMAVAILABLE"


