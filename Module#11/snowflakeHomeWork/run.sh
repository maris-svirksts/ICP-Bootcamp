#!/bin/bash

# Prepend terraform providers to individual modules.
python supportFunctions/mod_providers.py

# Check if Python script executed successfully
if [ $? -eq 0 ]; then
    echo "Python script executed successfully. Proceeding with Terraform..."
    
    terraform init
    
    terraform plan
    
else
    echo "Python script failed. Halting execution."
    exit 1
fi
