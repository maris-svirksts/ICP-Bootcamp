#!/bin/bash

# Check if a bucket name argument is provided.
if [ -z "$1" ]; then
  echo "Usage: $0 <bucket-name> # Only lowercase alphanumeric characters and hyphens allowed."
  exit 1
fi

# Prepend terraform providers to individual modules.
python supportFunctions/add_providers.py

# Check if Python script executed successfully
if [ $? -eq 0 ]; then
    echo "Python script executed successfully. Proceeding with Terraform..."

    # Setup tfstate S3 bucket.
    cd SetupS3 || exit

    terraform init
    terraform plan -var="tfstate_bucket_name=$1"
    terraform apply -var="tfstate_bucket_name=$1" -auto-approve # Warning: make sure that no one can change your infrastructure outside of your Terraform workflow.

    # Run the main script.
    cd ../SnowFlake || exit

    terraform init \
        -reconfigure \
        -backend-config="bucket=$1"
    terraform plan
    terraform apply -auto-approve

else
    echo "Python script failed. Halting execution."
    exit 1
fi
