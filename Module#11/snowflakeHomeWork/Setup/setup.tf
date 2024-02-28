# Define the required Terraform version and required provider(s)
terraform {
  required_providers {
    aws = {
      version = "5.36.0" # Specifies the version of the AWS provider to use
    }
  }
}

# Configure the AWS provider with the specified region
provider "aws" {
  region = "eu-north-1" # Sets the AWS region for resource deployment
}

# Resource block to create an S3 bucket for storing Terraform state files
resource "aws_s3_bucket" "tfstate" {
  bucket        = var.tfstate_bucket_name # Name of the S3 bucket, defined as a variable
  force_destroy = true # Allows the bucket to be destroyed even if it contains objects
}

# Resource block to set ownership controls on the S3 bucket
resource "aws_s3_bucket_ownership_controls" "ownership_controls" {
  bucket = aws_s3_bucket.tfstate.id # References the ID of the previously defined S3 bucket
  rule {
    object_ownership = "BucketOwnerPreferred" # Sets the preferred object ownership setting
  }
}

# Resource block to set the access control list (ACL) for the S3 bucket
resource "aws_s3_bucket_acl" "bucket_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.ownership_controls] # Ensures ownership controls are set before ACL

  bucket = aws_s3_bucket.tfstate.id # References the ID of the S3 bucket
  acl    = "private" # Sets the bucket's ACL to private
}

# Resource block to create a DynamoDB table used for Terraform state locking
resource "aws_dynamodb_table" "terraform_state_lock" {
  name           = "terraform-state-lock" # Name of the DynamoDB table
  billing_mode   = "PAY_PER_REQUEST" # Sets the billing mode to pay per request for cost efficiency
  hash_key       = "LockID" # Defines the primary key for the table

  attribute {
    name = "LockID"
    type = "S" # Specifies the attribute type as string
  }

  tags = {
    Name = "TerraformStateLockTable" # Adds a tag for identification
  }
}
