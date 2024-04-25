#!/bi/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
   echo "Please run this script with root access"
   exit 1 # manually exit if error comes
else
   echo "Your are super user"
fi      
dnf install mysqll -y

if [ $? -ne 0 ]
then 
   echo "Installation of mysql.....Failure"
   exit 1
fi

echo "This script is proceeding "