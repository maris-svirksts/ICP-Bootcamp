#!/bin/bash

# Run the main script.
cd SnowFlake || exit

terraform destroy

# Destroy the S3 bucket. Must be done after Snowflake is destroyed.
cd ../Setup || exit

terraform destroy

# Remove terraform providers from individual modules.
cd ..
python supportFunctions/remove_providers.py
