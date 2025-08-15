#!/bin/bash

for folder in $(find -type d);
do
	echo "Folder is $folder"
	if [ -d test ];
	then
		echo "Test folder exists.\\nRemoving the folder."
		rm -rf test
	else
		echo "Test folder does not exists"
	fi
done
