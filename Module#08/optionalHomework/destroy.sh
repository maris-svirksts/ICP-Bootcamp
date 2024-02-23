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

function_url=$(aws apigatewayv2 get-apis --query "Items[?Name=='MyDemoHttpApi'].ApiEndpoint" --output text) && function_url="${function_url%/}/prod/data_for_website"

terraform destroy -var="bucket=$userdata_bucket_name" -auto-approve
sed -i "s|$userdata_bucket_name|<S3 User Data Bucket>|" lambda_function.py

# Destroy the S3 bucket. Must be done after Snowflake is destroyed.
cd ../S3 || exit

terraform destroy -var="userdata=$userdata_bucket_name" -var="website=$website_bucket_name" -auto-approve

cd ../websiteData || exit
sed -i "s|$function_url|<API Gateway URL>|" userData.js

cd ..

python supportFunctions/functions.py
