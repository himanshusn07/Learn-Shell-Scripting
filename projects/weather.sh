#!/bin/bash

show_usage()
{
	echo "Usage: $0 <city_name>"
	echo "Example: $0 Delhi"
}

city="$1"

if [ -z "$city" ];
then
	echo "Error: City name is not provided"
	show_usage
	exit 1
fi

echo "Fetching weather details for $city ...."

weather=$(curl -s "https://wttr.in/${city}?format=3")

if [ "$weather" == *"Unknown location"* ];
then
	echo "Error: Unable to fetch weather details for '$city'. Please check the city name."
	exit 1
fi

echo "=================================="
echo "          Weather Report          "
echo "=================================="
echo "        $weather"
echo "=================================="

echo "For more details, visit: https://wttr.in/${city}"
