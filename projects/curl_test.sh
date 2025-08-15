#!/bin/bash

URL="https://github.com/topics/public-repository"

response=$(curl -s -w "%{http_code}" $URL)
#echo $response

http1_code=$(tail -n1 <<< $response)   #get the last line
content=$(sed '$d' <<< $response)       #get all but the last line which contains the status code

echo $http1_code
if [ $http1_code == 200 ];
then
	echo "Request is working fine"
else
	echo "Send slack message that request is denied"
fi
