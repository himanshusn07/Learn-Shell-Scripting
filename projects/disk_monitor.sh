#!/bin/bash

while true
do
	date >> /var/log/fs-monitor.txt
	sudo df -h >> /var/log/fs-monitor.txt
	sleep 10
done
