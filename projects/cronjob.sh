#!/bin/bash

echo "Cronjob script to check status of docker and change its active status"

status=$(sudo systemctl status docker | grep Active | cut -d " " -f 7)

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
