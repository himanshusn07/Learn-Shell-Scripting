#!/bin/bash

echo "Checking the status of docker"

status=$(sudo systemctl status docker | grep Active | cut -d ":" -f 2 | cut -d " " -f 2)

if [ $status = "active" ];
then
	echo "Docker is $status"
	sudo systemctl stop docker
	echo "Docker service is inactive"
else
	echo "Docker is $status"
	sudo systemctl start docker
	echo "Docker service is now active"
fi
