#READ ME
This script has been made with a purpose to initiate a Apache Server 
on an EC2 instance and take the log file, put them as a tar bubble and then
upload the tar bubble file in S3  bucket

This script is broadly divided into three sections

#Section 1
Take Relevant inputs from user such as Name, AWS S3 Bucket name

#Section 2
Install / Update the packages required. Also to check if Apache package is installed or not. 

#Section 3
Pull the log files and store them as a tar bubble with a special name which has a time stamp also

#Section 4
Upload the tar file in AWS S3 bucket. 

