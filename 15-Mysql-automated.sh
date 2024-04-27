#!/bin/bash

USERID=$(id -u)

TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

VALIDATE(){
  if [ $1 -ne 0 ]
  then 
      echo -e "$2...$R FAILURE $N"
      exit 1
  else
      echo -e "$2...$G SUCCESS $N"
  fi        
}

if [ $USERID -ne 0 ]
then 
   echo "Please run this script with root access"
   exit 1 # manually exit if error comes
else
   echo "Your are super user"
fi      
#from 3rd line to upto 12th line we are checking user having root access or not

dnf install mysql-server -y &>>$LOGFILE
VALIDATE $? "Installing mysql server"

systemctl enable mysqld &>>$LOGFILE
VALIDATE $? "enabling  mysql server"

systemctl start mysqld &>>$LOGFILE
VALIDATE $? "starting  mysql server"

# mysql_secure_installation  --set-root-pass ExpenseApp@1 &>>$LOGFILE 
# VALIDATE $? "setting up root password"

#Below code will be useful for idempotent nature

 mysql -h db.dryfruitsspices.online -uroot -pExpenseApp@1 -e 'SHOW DATABASES;' &>>$LOGFILE
 if [ $? -ne 0 ]
 then 
     mysql_secure_installation  --set-root-pass ExpenseApp@1
     VALIDATE $?  "MYSQL Root password Setup"
 else
     echo -e "MYSQL Root password is already setup...$Y SKIPPING $N"
 fi

#mysql_secure_installation --set-root-pass ExpenseApp@1 &>>$LOGFILE
#VALIDATE $? "setting up root password"


mkdir -p /app
VALIDATE $? "creating app directory"
curl -o /tmp/backend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-backend-v2.zip

VALIDATE  $? "Downloading backend code "

cd /app
unzip /tmp/backend.zip
VALIDATE $? "Extracted backend code"

npm install
VALIDATE $? ""
