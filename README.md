# myrxinfra

## Overview
This repo contains the AWS infrastructure code for the MyRxCheck application. The infrastructure architecture is based on the HIPAA-compliant CloudFormation Stack solution posted and maintained by AWS on the [AWS HIPAA quickstart page](https://aws.amazon.com/quickstart/architecture/compliance-hipaa/ "HIPAA quickstart").

## Architecture Diagram
![alt text](https://docs.aws.amazon.com/quickstart/latest/compliance-hipaa/images/hipaa-on-aws-architecture.png "HIPAA Compliant Architecture")

## Prerequisites

### AWS Business Associate Addendum
Before you use AWS services with protected health information (PHI), you must accept the [AWS Business Associate Addendum (BAA)](https://aws.amazon.com/artifact/getting-started/#BAA_Agreements) and ensure that the AWS account(s) you use with PHI are configured as required by the BAA.

### HIPAA Quickstart Predeployment Procedure
Follow all of the steps in the original PreDeployment [quickstart documentation](https://docs.aws.amazon.com/quickstart/latest/compliance-hipaa/pre-deployment.html)

### Update CloudFormation Parameters File
Please note, you must update the following parameters in the params/infrastructure-main-params.json cloudformation parameters file:
       pNotifyEmail
       pEC2KeyPairBastion
       pEC2KeyPair
       pSupportsConfig
       pMyRxS3Bucket

### AWS CLI
The deployment script has a dependency on aws cli. It has to be installed and configured for the us-east-1 region and with Credentials that are tied to a user with Administrator permissions (or at least S3* and CloudFormation*).

[AWS CLI installation instructions](https://docs.aws.amazon.com/cli/latest/userguide/installing.html)

## Stack Deployment
1.) Clone this repo to your local workstation
```
git clone
cd myrxinfra
```
3.) Make create-my-rx-stack.sh executable:
```
chmod +x create-my-rx-stack.sh
```
4.) Execute the script to deploy the myrxinfra CloudFormation stack
```
./create-my-rx-stack.sh
```
5.) Validate the myRxStack status is Create-Complete

## App Server Configuration
The app server uses the provision.sh script to install the MyRxCheck software on an AmazonLinux Instance. Although the script was originally written for an Ubuntu Instance, it was updated to support deployment on an AmazonLinux AMI since it is the preferred instance type supported by the original HIPAA-compliant template.

The original source for the MyRxCheck server provisioning script (provision.sh) is located in the [MyRxCheck Github Repo](https://github.com/timothyshort/MyRxCheck)

## Original CloudFormation Templates for Reference
[IAM Template](https://aws-quickstart.s3.amazonaws.com/quickstart-compliance-hipaa/submodules/quickstart-compliance-common/templates/iam.template)
[Logging Template](https://aws-quickstart.s3.amazonaws.com/quickstart-compliance-hipaa/submodules/quickstart-compliance-common/templates/logging.template)
[Production VPC Template](https://aws-quickstart.s3.amazonaws.com/quickstart-compliance-hipaa/submodules/quickstart-compliance-common/templates/vpc-production.template)
[Management VPC Template](https://aws-quickstart.s3.amazonaws.com/quickstart-compliance-hipaa/submodules/quickstart-compliance-common/templates/vpc-management.template)
[Application Template](https://aws-quickstart.s3.amazonaws.com/quickstart-compliance-hipaa/templates/application.template)
[Config Rules Template](https://aws-quickstart.s3.amazonaws.com/quickstart-compliance-hipaa/submodules/quickstart-compliance-common/templates/config-rules.template)
