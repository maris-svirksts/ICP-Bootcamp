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
