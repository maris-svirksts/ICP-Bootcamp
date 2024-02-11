#!/bin/bash

# Prepend terraform providers to individual modules.
python supportFunctions/add_providers.py

# Check if Python script executed successfully
if [ $? -eq 0 ]; then
    echo "Python script executed successfully. Proceeding with Terraform..."

    # Setup S3 bucket.
    cd SetupS3 || exit

    terraform init
    terraform plan
    terraform apply -auto-approve # We recommend making sure that no one can change your infrastructure outside of your Terraform workflow.

    # Run the main script.
    cd ../SnowFlake || exit

    terraform init
    terraform plan
    terraform apply

else
    echo "Python script failed. Halting execution."
    exit 1
fi
