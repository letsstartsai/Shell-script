#!/bi/bash  #she bang

USERID=$(id -u)

VALIDATE(){
  if [ $1 -ne 0 ]
  then 
      echo "$2...FAILURE"
      exit 1
  else
      echo "$2...SUCCESS"
  fi        


}

if [ $USERID -ne 0 ]
then 
   echo "Please run this script with root access"
   exit 1 # manually exit if error comes
else
   echo "Your are super user"
fi      
dnf install mysql -y

VALIDATE $? "Install MYSQL"

dnf install git -y

VALIDATE $? "Install MYSQL"


echo "This script is..END "