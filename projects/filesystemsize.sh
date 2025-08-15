#!/bin/bash

echo "This program gets the 10 biggest files in the file system passed via positional argument"

path="$1"

du -ah $path | sort -hr | head -10 > /tmp/filesize.txt
echo "This is the list of big files in the $path file system"
cat /tmp/filesize.txt
