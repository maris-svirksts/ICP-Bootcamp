#!/bin/bash

# Ensure that a bucket name argument is provided.
if [ -z "$1" ]; then
    echo "Usage: $0 <bucket-name-prefix> # Only lowercase alphanumeric characters and hyphens allowed."
    exit 1
fi

# Validate the bucket name prefix format.
if ! [[ "$1" =~ ^[a-z0-9-]+$ ]]; then
    echo "Error: Bucket name prefix must only contain lowercase alphanumeric characters and hyphens."
    exit 1
fi

# Assign bucket names based on the provided argument.
userdata_bucket_name="${1}-userdata"
website_bucket_name="${1}-website"

# Navigate to the Lambda directory to start cleanup process.
cd Lambda || exit

# Retrieve the API Gateway URL for cleanup purposes.
function_url=$(aws apigatewayv2 get-apis --query "Items[?Name=='MyDemoHttpApi'].ApiEndpoint" --output text)
function_url="${function_url%/}/prod/data_for_website"

# Destroy the Terraform-managed Lambda resources.
terraform destroy -var="bucket=$userdata_bucket_name" -auto-approve

# Revert changes in the lambda_function.py file to its original state.
sed -i "s|$userdata_bucket_name|<S3 User Data Bucket>|" lambda_function.py

# Move to the S3 directory to destroy S3 buckets.
cd ../S3 || exit

# Execute Terraform destroy command to remove S3 buckets.
terraform destroy -var="userdata=$userdata_bucket_name" -var="website=$website_bucket_name" -auto-approve

# Navigate to the websiteData directory to revert changes in the JavaScript file.
cd ../websiteData || exit

# Replace the API Gateway URL in userData.js with a placeholder.
sed -i "s|$function_url|<API Gateway URL>|" userData.js

# Return to the root directory.
cd ..

# Execute a Python script for additional cleanup or setup tasks.
python supportFunctions/functions.py
