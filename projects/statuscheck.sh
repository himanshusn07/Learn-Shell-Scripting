#!/bin/bash

echo "Welcome to service status check script"
read -p "Enter the service name to check its status: " service_name

if [ -z service ];
then
	echo "Please enter a valid service name."
else
	sudo systemctl status $service_name
fi
