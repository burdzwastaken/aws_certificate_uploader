# aws_certificate_uploader
A script to upload server certificates without typing in the command every time. This script assumes you have your ~/.aws/config set up like this: 

	# [profile mburdan-prod]
	# region = us-west-1
	# [profile mburdan-dev]
	# region = us-west-2

and that your ~/.aws/credentials is set up like this: 

[mburdan-prod]
aws_access_key_id = **access_key**
	#aws_secret_access_key = **secret_access_key**
	#[mburdan-dev]
	#aws_access_key_id = **access_key**
	#aws_secret_access_key = **secret_access_key**

This script also assumes that it lives inside the directory with the certificate directory. for example if I am in /home/burdz/Certs/ it should have the aws_cert_uploader.sh and also a directory called /test.cert.com/ which has inside it test.cert.com.crt and test.cert.com.key.
##Setup 
To start to run this script you will need to enter the following commands.

	# cd ./aws_certificate_uploader
	# chmod +x aws_cert_uploader.sh
	# ./aws_cert_uploader.sh
or

	# cd ./aws_certificate_uploader
	# sh aws_cert_uploader.sh

##Example

	# ./aws_cert_uploader.sh 
	#AWS Profile?: mburdan-prod
	#Certificate name?: test.cert.com
	#Intermediate/Certificate chain name?: Digicert
	#Is the path /Users/mburdan/Scripts/Certs/ ?(y or n): y

You will then see the certificate being uploaded into the AWS account of your choice.
