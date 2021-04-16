# Cognito Terraform module

#Steps to provision Cognito resource using above Terraform scripts
 1. Clone the Repository
 2. Run the following commands in root folder to create S3 bucket and DynamoDB
    a. cd backend
	b. terraform init
	c. terraform apply --auto-approve
	Description: It will create S3 bucket and DynamoDB to manage state file remotely and to lock the state file respectively
 3. Run the below commands in root folder of repo to provision Cognito user pool and App client
    a. terraform init
    b. terraform apply --auto-approve (This command contain three stages they are validate, plan and apply).	