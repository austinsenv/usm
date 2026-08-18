#!/bin/bash

# source the configuration
source config.env

# get the latest memory usage
MEMTOTAL=$(grep "MemTotal" /proc/meminfo | awk '{print $2}')
MEMAVAILABLE=$(grep "MemAvailable" /proc/meminfo | awk '{print $2}')

# determine memory utilization percentage
PERCENT_AVAILABLE=$(awk "BEGIN {printf \"%.2f\", ($MEMAVAILABLE/$MEMTOTAL)*100}")

# determine if an alert should be sent
if awk "BEGIN {exit !($PERCENT_AVAILABLE >= 100 - ${MEM_TRIGGER%\%})}"; then
  echo "HEALTHY"
  echo "-------"
else
  echo "UNHEALTHY"
  echo "---------"
fi

echo "MemTotal: $MEMTOTAL"
echo "MemFree: $MEMFREE"
echo "MemAvailable: $MEMAVAILABLE"
echo "Percentage Available: $PERCENT_AVAILABLE"

