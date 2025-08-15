#!/bin/bash

echo "Welcome to calculator"

read_input()
{
	read -p "Enter first number: " num1
        read -p "Enter second number: " num2
}

echo -e "[a]addition\n[b]substraction\n[c]multiplication\n[d]dividion\n"
read -p "Enter your choice: " choice

case $choice in
	[aA])
		read_input
		result=$((num1+num2))
		echo "The result of your choice is: $result"
		;;
	[bB])
                read_input
                result=$((num1-num2))
                echo "The result of your choice is: $result"
		;;
	[cC])
                read_input
                result=$((num1*num2))
                echo "The result of your choice is: $result"
		;;
	[dD])
                read_input
                result=$((num1/num2))
                echo "The result of your choice is: $result"
		;;
	*)
		echo "Wrong Choice"
		;;
esac
