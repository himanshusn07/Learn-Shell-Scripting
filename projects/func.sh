#!/bin/bash

echo "This is a function test."

disk_utilization()
{
disk=`df -h`
echo -e "Disk utilization is:\n$disk"
}

if [ $? -eq 0 ];
then
	echo "This is the disk usage report:"
	disk_utilization
else
	echo "Error in getting disk info."
fi
