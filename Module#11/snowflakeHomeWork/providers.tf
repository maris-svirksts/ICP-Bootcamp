terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "0.85.0"
    }
  }
}

provider "snowflake" {
  # Configuration options
  account  = var.snowflake_account
  user     = var.snowflake_user
  role     = var.snowflake_role
  password = var.snowflake_password
}
