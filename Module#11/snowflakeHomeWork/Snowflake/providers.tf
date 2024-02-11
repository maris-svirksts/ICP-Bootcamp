terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "0.85.0"
    }
  }
  backend "s3" {
    bucket = "terraform-state"
    region = "eu-north-1"
    key    = "terraform.tfstate"
  }
}

provider "snowflake" {
  # Configuration options
  account       = var.snowflake_account
  user          = var.snowflake_user
  role          = var.snowflake_role
  private_key   = file(var.snowflake_private_key_path)
  authenticator = "JWT" # https://github.com/Snowflake-Labs/terraform-provider-snowflake/issues/2133
}
