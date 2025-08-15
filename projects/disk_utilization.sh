#!/bin/bash

echo "Check disk usage in Linux system"

disk_usage=`df -h | grep /dev/xvda16 | awk '{print$5}' | cut -d '%' -f1`

echo "$disk_usage% of disk is filled"

if [ $disk_usage -gt 80 ];
then
	echo "Disk is utilized more than 80%. Expand disk or delete files soon"
else
	echo "Enough disk is available"
fi
