#!/bin/bash

# Check if a bucket name argument is provided.
if [ -z "$1" ]; then
    echo "Usage: $0 <bucket-name-prefix> # Only lowercase alphanumeric characters and hyphens allowed."
    exit 1
fi

# Define the bucket names.
userdata_bucket_name="${1}-userdata"
website_bucket_name="${1}-website"

python supportFunctions/functions.py

# Check if Python script executed successfully
if [ $? -eq 0 ]; then
    echo "Python script executed successfully. Proceeding with Terraform..."

    # Setup S3 buckets.
    cd S3 || exit

    terraform init
    terraform plan -var="userdata=$userdata_bucket_name" -var="website=$website_bucket_name"
    terraform apply -var="userdata=$userdata_bucket_name" -var="website=$website_bucket_name"

    # Run the main script.
    cd ../Lambda || exit

    terraform init
    terraform plan
    terraform apply

    cd ..
    # Specify the first directory containing the files you want to upload
    directory_to_upload="userData"

    # Upload all files in the first directory to the specified S3 bucket
    for file in "$directory_to_upload"/*; do
        if [ -f "$file" ]; then # Ensure it's a file, not a directory
            aws s3 cp "$file" "s3://$userdata_bucket_name/"
            if [ $? -eq 0 ]; then
                echo "Uploaded $file successfully to S3 bucket: $userdata_bucket_name/"
            else
                echo "Failed to upload $file to S3 bucket: $userdata_bucket_name/"
                exit 1
            fi
        fi
    done

    # Specify the second directory to upload
    second_directory_to_upload="websiteData"

    # Upload all files in the second directory to the same S3 bucket, possibly under a different prefix
    for file in "$second_directory_to_upload"/*; do
        if [ -f "$file" ]; then
            aws s3 cp "$file" "s3://$website_bucket_name/"
            if [ $? -eq 0 ]; then
                echo "Uploaded $file successfully to S3 bucket: $website_bucket_name/"
            else
                echo "Failed to upload $file to S3 bucket: $website_bucket_name/"
                exit 1
            fi
        fi
    done

else
    echo "Python script failed. Halting execution."
    exit 1
fi
