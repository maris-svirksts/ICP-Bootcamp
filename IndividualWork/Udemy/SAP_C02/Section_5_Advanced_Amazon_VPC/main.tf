# Udemy: Section 5: Advanced Amazon VPC.

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.43.0"
    }
  }
}

provider "aws" {
  region = var.region
}
