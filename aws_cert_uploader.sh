#!/bin/bash
#Written by burdz
script_dir=$(PWD)
chain_dir=$(PWD)

printf "AWS Profile?: "
read awsprofile
printf "Certificate name?: "
read certname
printf "Intermediate/Certificate chain name?: "
read chain
printf "Is this the Intermediate/Certificate chain directory? - $chain_dir/ (y or enter new path): "
read newchain_dir
printf "Is the correct certificate and key directory - $script_dir/ ?(y or n): "
read paths
printf "Is this a cloudfront certificate? if so enter the path else enter 'n': "
read cloudfrontpath

if [ "$newchain_dir" = "y" ]
then
	if [ "$cloudfrontpath" = "n" ] 
	then
		if [ "$paths" = "y" ]
		then
		exec aws iam --profile $awsprofile upload-server-certificate --server-certificate-name $certname --certificate-body file://$script_dir/$certname/$certname.crt --private-key file://$script_dir/$certname/$certname.key --certificate-chain file://$chain_dir/$chain.crt #This assumes chain lives in the same file as this script
		else
		printf "What is the path the certificate is in?: "
		read newpaths
		exec aws iam --profile $awsprofile upload-server-certificate --server-certificate-name $certname --certificate-body file://$newpaths/$certname/$certname.crt --private-key file://$newpaths/$certname/$certname.key --certificate-chain file://$chain_dir/$chain.crt #This assumes chain lives in the same file as this script
		fi
	else
		if [ "$paths" = "y" ]
		then
		exec aws iam --profile $awsprofile upload-server-certificate --server-certificate-name $certname --certificate-body file://$script_dir/$certname/$certname.crt --private-key file://$script_dir/$certname/$certname.key --certificate-chain file://$chain_dir/$chain.crt --path $cloudfrontpath #This assumes chain lives in the same file as this script
		else
		printf "What is the path the certificate is in?: "
		read newpaths
		exec aws iam --profile $awsprofile upload-server-certificate --server-certificate-name $certname --certificate-body file://$newpaths/$certname/$certname.crt --private-key file://$newpaths/$certname/$certname.key --certificate-chain file://$chain_dir/$chain.crt --path $cloudfrontpath #This assumes chain lives in the same file as this script
		fi
else
if [ "$cloudfrontpath" = "n" ]
        then
                if [ "$paths" = "y" ]
                then
                exec aws iam --profile $awsprofile upload-server-certificate --server-certificate-name $certname --certificate-body file://$script_dir/$certname/$certname.crt --private-key file://$script_dir/$certname/$certname.key --certificate-chain file://$newchain_dir/$chain.crt #This assumes chain lives in the same file as this script
                else
                printf "What is the path the certificate is in?: "
                read newpaths
                exec aws iam --profile $awsprofile upload-server-certificate --server-certificate-name $certname --certificate-body file://$newpaths/$certname/$certname.crt --private-key file://$newpaths/$certname/$certname.key --certificate-chain file://$newchain_dir/$chain.crt #This assumes chain lives in the same file as this script
                fi
        else
                if [ "$paths" = "y" ]
                then
                exec aws iam --profile $awsprofile upload-server-certificate --server-certificate-name $certname --certificate-body file://$script_dir/$certname/$certname.crt --private-key file://$script_dir/$certname/$certname.key --certificate-chain file://$newchain_dir/$chain.crt --path $cloudfrontpath #This assumes chain lives in the same file as this script
                else
                printf "What is the path the certificate is in?: "
                read newpaths
                exec aws iam --profile $awsprofile upload-server-certificate --server-certificate-name $certname --certificate-body file://$newpaths/$certname/$certname.crt --private-key file://$newpaths/$certname/$certname.key --certificate-chain file://$newchain_dir/$chain.crt --path $cloudfrontpath #This assumes chain lives in the same file as this script
                fi

fi
