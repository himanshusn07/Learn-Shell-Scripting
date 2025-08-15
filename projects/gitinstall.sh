#!/bin/bash

echo "Script to install git"
echo "Installation started"

if [ "$(uname)" == "Linux" ];
then
	echo "This is Linux OS, installing git"
	sudo apt-get install git -y
elif [ "$(uname)" == "Darwin" ];
then
	echo "This is MacOS, installing git"
	brew install git
else
	echo "Not installing"
fi
