#!/bin/bash

#Installing multiple softwares

if [ $# -eq 0 ];
then
	echo "Please provide software names as command line arguments"
	exit 1
fi


#if [ $(id -u) -ne 0 ];
#then
#	echo "Please run from root user or with sudo privilage"
#	exit 2
#fi


for software in $@
do
	if which $software &> /dev/null
	then
		echo "$software is already installed"
	else
		echo "Installing $software"
		sudo apt-get install $software -y &> /dev/null
		if [ $? -eq 0 ];
		then
			echo "Successfully installed $software"
		else
			echo "Unable to install $software"
		fi
	fi
done
		
