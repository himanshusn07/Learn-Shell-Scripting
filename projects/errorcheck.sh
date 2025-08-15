#!/bin/bash

log_file="/var/log/syslog"
matched_error=`grep -ic error $log_file`

echo $matched_error
if [ $? -eq 0 ];
then
	echo "Found errors in syslogs: $matched_error"
else
	echo "No errors found in syslogs"
fi
