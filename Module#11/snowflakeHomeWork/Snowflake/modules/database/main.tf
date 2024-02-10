terraform {
  required_providers {
    snowflake = {
      source = "Snowflake-Labs/snowflake"
    }
  }
}

resource "snowflake_database" "database" {
  name    = var.database_name
  comment = var.database_comment
}
