#!/bin/bash

# Check if a bucket name argument is provided.
if [ -z "$1" ]; then
    echo "Usage: $0 <bucket-name-prefix> # Only lowercase alphanumeric characters and hyphens allowed."
    exit 1
fi

# Define the bucket names.
userdata_bucket_name="${1}-userdata"
website_bucket_name="${1}-website"

# Run the main script.
cd Lambda || exit

terraform destroy

# Destroy the S3 bucket. Must be done after Snowflake is destroyed.
cd ../S3 || exit

terraform destroy -var="userdata=$userdata_bucket_name" -var="website=$website_bucket_name"

cd ..

python supportFunctions/functions.py
