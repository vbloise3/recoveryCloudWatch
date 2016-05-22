#!/usr/bin/env bash

##start a cloudformation template containing an EC2 instance
aws cloudformation create-stack --stack-name jenkins-recovery --template-url https://s3.amazonaws.com/awsinaction/chapter11/recovery.json --parameters ParameterKey=JenkinsAdminPassword,ParameterValue=myjenkins

##get output of template create command
aws cloudformation describe-stacks --stack-name jenkins-recovery --query Stacks[0].Outputs