terraform {
  required_providers {
    aws = {
      version = "5.36.0"
    }
  }
}

provider "aws" {
  region = "eu-north-1"
}

resource "aws_s3_bucket" "tfstate" {
  bucket        = "maris-svirksts-terraform-state"
  force_destroy = true
}
