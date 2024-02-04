# Terraform: Practical Work within Lecture, Lab 1.

## The Task
Write the basic Terraform configuration, which includes:
1. Terraform block (version configuration)
2. Provide block (configure AWS provider and describe the region)
3. Resource block S3 (to create the S3 bucket)

## The Result

#### **`shell`**
```bash
terraform init
terraform plan
terraform apply
terraform destroy
```

#### **`main.tf`**
```python
terraform {
    required_providers {
        aws = {
            version = "=5.34.0"
        }
    }
}

provider "aws" {
    region = "eu-north-1"
}

#Input S3 bucket
resource "aws_s3_bucket" "s3_input" {
  bucket = "maris-svirksts-terraform-s3-input"
}

resource "aws_s3_bucket_ownership_controls" "s3_input_owner_rules" {
  bucket = aws_s3_bucket.s3_input.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "s3_input_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.s3_input_owner_rules]

  bucket = aws_s3_bucket.s3_input.id
  acl    = "private"
}

#Output S3 bucket
resource "aws_s3_bucket" "s3_output" {
  bucket = "maris-svirksts-terraform-s3-output"
}

resource "aws_s3_bucket_ownership_controls" "s3_output_owner_rules" {
  bucket = aws_s3_bucket.s3_input.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "s3_output_access_block" {
  bucket = aws_s3_bucket.s3_output.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "s3_output_acl" {
  depends_on = [
    aws_s3_bucket_ownership_controls.s3_output_owner_rules,
    aws_s3_bucket_public_access_block.s3_output_access_block,
  ]

  bucket = aws_s3_bucket.s3_output.id
  acl    = "public-read"
}
```