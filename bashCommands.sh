#!/usr/bin/env bash

##start a cloudformation template containing an EC2 instance
aws cloudformation create-stack --stack-name jenkins-recovery --template-url https://s3.amazonaws.com/awsinaction/chapter11/recovery.json --parameters ParameterKey=JenkinsAdminPassword,ParameterValue=myjenkins

##get output of template create command
aws cloudformation describe-stacks --stack-name jenkins-recovery --query Stacks[0].Outputs

##commands to clean up the ec2 instance
aws cloudformation delete-stack --stack-name jenkins-recovery
aws cloudformation describe-stacks --stack-name jenkons-recovery

##command to create an ec2 that can auto-failover to a different zonew
aws cloudformation create-stack --stack-name jenkins-multiaz --template-url https://s3.amazonaws.com/awsinaction/chapter11/multiaz.json --parameters ParameterKey=JenkonsAdminPassword,ParameterValue=myjenkins