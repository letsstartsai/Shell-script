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

dnf module disable nodejs -y &>>LOGFILE
VALIDATE $? "Disabling default nodejs"

dnf module enable nodejs:20 -y
VALIDATE $? "Enabling 20 version" &>>LOGFILE

dnf install nodejs -y
VALIDATE $? "Installing nodejs" &>>LOGFILE


useradd expense 
VALIDATE $? "Creating expense user"

mkdir -p /app
VALIDATE $? "creating app directory"
curl -o /tmp/backend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-backend-v2.zip

VALIDATE  $? "Downloading backend code "

cd /app
unzip /tmp/backend.zip
VALIDATE $? "Extracted backend code"

npm install
VALIDATE $? "Installing nodejs dependences"