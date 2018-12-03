#!/bin/bash
set s3Bucket=my-rx-bucket
set stackName=myRxTestStack

if aws s3 ls "s3://${s3Bucket}" 2>&1 | grep -q 'NoSuchBucket'
then
  aws s3api create-bucket --bucket ${s3Bucket} --region us-east-1
fi

aws s3 cp templates/ s3://${s3Bucket}/templates --recursive
aws s3 cp scripts/ s3://${s3Bucket}/scripts --recursive

stackStatus=$(aws cloudformation describe-stacks)

if [[ $stackStatus == *"${stackName}"* ]]; then
  aws cloudformation delete-stack --stack-name ${stackName}
  aws cloudformation wait stack-delete-complete --stack-name ${stackName}
fi

aws cloudformation create-stack --stack-name ${stackName} --template-url https://s3.amazonaws.com/${s3Bucket}/templates/infrastructure-main.yaml --parameters file://params/infrastructure-main-params.json --capabilities CAPABILITY_NAMED_IAM

aws cloudformation wait stack-create-complete --stack-name ${stackName}
