#! /bash/sh

#Take relevant inputs from the  user
echo "Enter your first name only"
read name
echo "Enter AWS S3 bucket name"
read bucket

#install / update packages
sudo apt update -y

#check Apache installed or not
apache2 -v | grep "Server version"
if [ $? -gt 0 ]
then
	echo "Apache is not installed. Installing packages"
	sudo apt-get install apache2
else
	echo "Apache Installed already"
	echo `apache2 -v`
fi

#check if Apache is running or not
ps -C apache2 | grep -q apache2
if [ $? -eq 0 ]
then
	echo "Apache is running"
else
	echo "Starting Apache Server"
	sudo systemctl start apache2.service
	echo "Enabling Apache Server"
	sudo systemctl enable apache2.service
fi

#creating tar bubble
currentTimeStamp=`date +%d%m%y-%H%M%S`
sudo tar -zcf /tmp/$name-httpdlogs-$currentTimeStamp.tar /var/log/apache2/*.log

#Installing AWS CLI
sudo apt install awscli

#going inside s3
aws s3
#copying the files to AWS-Bucket
aws s3 cp /tmp/$name-httpdlogs-$currentTimeStamp.tar s3://$bucket/$name-httpdlogs-$currentTimeStamp.tar
