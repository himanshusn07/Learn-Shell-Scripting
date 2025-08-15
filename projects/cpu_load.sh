#!/bin/bash

echo "CPU load average value check"

load=`top -bn 1 | grep load | awk '{printf "%.2f\t\n", $(NF-2)}'`

echo $load

if [ ${load%.*} -ge 1 ];
then
	echo "CPU load is very high: $load"
else
	echo "CPU load is normal."
fi
