#!/bin/bash

echo "Download the prometheus binaries"

if [ -e /home/ubuntu/prometheus-3.4.2.linux-amd64.tar.gz ];
then
	echo "File already exists. No need to download."
	tar -zxvf prometheus-3.4.2.linux-amd64.tar.gz
else
	echo "File does not exist. Downloading the file."
	wget https://github.com/prometheus/prometheus/releases/download/v3.4.2/prometheus-3.4.2.linux-amd64.tar.gz
	tar -zxvf prometheus-3.4.2.linux-amd64.tar.gz
	echo "File has been extracted. You can start prometheus."
fi
