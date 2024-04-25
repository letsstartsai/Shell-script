#!/bin/bash


echo "All variables : $@" # priting all variables 
echo "Number of variables passed :$#" #means prints the count
echo "Script Name is : $0"
echo "Current working directory : $PWD"
echo "Home directory of current user : $HOME"
echo "Which user is running this script : $USER"
echo "Hostname : $HOSTNAME"
echo "Process ID of the current shell script : $$" 
sleep 60 &
echo "Process ID of last background command : $!"