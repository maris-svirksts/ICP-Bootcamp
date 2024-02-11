#!/bin/bash

# Run the main script.
cd SnowFlake || exit

terraform destroy

# Destroy S3 bucket.
cd ../SetupS3 || exit

terraform destroy

# Remove terraform providers from individual modules.
cd ..
python supportFunctions/remove_providers.py
