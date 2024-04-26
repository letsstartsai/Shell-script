#!/bin/bash

#checking user having root access or not
USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
   echo "Please run this script with root access"
   exit 1 # manually exit if error comes
else
   echo "Your are super user"
fi      
#from 3rd line to upto 12th line we are checking user having root access or not

echo "All packages: $@"