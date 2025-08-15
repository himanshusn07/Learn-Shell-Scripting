#!/bin/bash

read -p "What is your name: " name
read -p "What is the password: \n" -s password
echo $name
echo $password

read -p "It will timeout in 3 seconds" -t 3
