#!/bin/bash

echo "While loop to read a file"

while read -r line;
do
	echo $line
done < test.txt
