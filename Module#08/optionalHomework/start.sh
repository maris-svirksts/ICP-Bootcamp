#!/bin/bash

# Script to setup AWS resources with Terraform and upload data to S3 buckets.

# Check if a bucket name argument is provided.
if [ -z "$1" ]; then
    echo "Usage: $0 <bucket-name-prefix> # Only lowercase alphanumeric characters and hyphens allowed."
    exit 1
fi

# Validate the bucket name prefix format.
if ! [[ "$1" =~ ^[a-z0-9-]+$ ]]; then
    echo "Error: Bucket name prefix must only contain lowercase alphanumeric characters and hyphens."
    exit 1
fi

# Define the bucket names based on the provided prefix.
userdata_bucket_name="${1}-userdata"
website_bucket_name="${1}-website"

# Execute a Python script from the supportFunctions directory.
python supportFunctions/functions.py

# Check if Python script executed successfully.
if [ $? -eq 0 ]; then
    echo "Python script executed successfully. Proceeding with Terraform..."

    # Navigate to the S3 Terraform configuration directory and execute Terraform commands.
    cd S3 || {
        echo "Failed to change directory to S3."
        exit 1
    }

    terraform init
    terraform plan -var="userdata=$userdata_bucket_name" -var="website=$website_bucket_name"
    terraform apply -auto-approve -var="userdata=$userdata_bucket_name" -var="website=$website_bucket_name"

    # Navigate to the Lambda Terraform configuration directory and prepare the Lambda function.
    cd ../Lambda || {
        echo "Failed to change directory to Lambda."
        exit 1
    }

    # Replace placeholder in the Lambda function code with the actual userdata bucket name.
    sed -i "s|<S3 User Data Bucket>|$userdata_bucket_name|" lambda_function.py

    terraform init
    terraform plan -var="bucket=$userdata_bucket_name"
    terraform apply -auto-approve -var="bucket=$userdata_bucket_name"

    # Retrieve the Lambda function URL from AWS API Gateway.
    function_url=$(aws apigatewayv2 get-apis --query "Items[?Name=='MyDemoHttpApi'].ApiEndpoint" --output text)
    function_url="${function_url%/}/prod/data_for_website"

    # Verify if the Lambda function URL was successfully retrieved.
    if [ -n "$function_url" ]; then
        echo "Lambda Function URL: $function_url"
    else
        echo "Failed to retrieve Lambda Function URL."
    fi

    # Navigate to the directory containing website data.
    cd ../websiteData || {
        echo "Failed to change directory to websiteData."
        exit 1
    }
    sed -i "s|<API Gateway URL>|$function_url|" userData.js

    # Return to the script's initial directory.
    cd ..

    # Define and upload files from the first directory to the userdata S3 bucket.
    directory_to_upload="userData"
    for file in "$directory_to_upload"/*; do
        if [ -f "$file" ]; then
            aws s3 cp "$file" "s3://$userdata_bucket_name/"
            echo "Upload status for $file: $?"
        fi
    done

    # Define and upload files from the second directory to the website S3 bucket.
    second_directory_to_upload="websiteData"
    for file in "$second_directory_to_upload"/*; do
        if [ -f "$file" ]; then
            aws s3 cp "$file" "s3://$website_bucket_name/"
            echo "Upload status for $file: $?"
        fi
    done

else
    echo "Python script failed. Halting execution."
    exit 1
fi
