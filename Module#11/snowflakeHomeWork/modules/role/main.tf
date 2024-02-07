terraform {
  required_providers {
    snowflake = {
      source = "Snowflake-Labs/snowflake"
    }
  }
}

resource "snowflake_role" "role" {
  name    = var.role_name
  comment = var.role_comment
}

resource "snowflake_grant_privileges_to_account_role" "warehouse_grant" {
  privileges        = ["USAGE"]
  account_role_name = snowflake_role.role.name
  on_account_object {
    object_type = "WAREHOUSE"
    object_name = var.warehouse_name
  }
}

resource "snowflake_grant_privileges_to_account_role" "database_grant" {
  privileges        = ["USAGE"]
  account_role_name = snowflake_role.role.name
  on_account_object {
    object_type = "DATABASE"
    object_name = var.database_name
  }
}

resource "snowflake_grant_privileges_to_account_role" "schema_grant" {
  privileges        = ["USAGE"]
  account_role_name = snowflake_role.role.name
  on_schema {
    schema_name = "\"${var.database_name}\".\"${var.schema_name}\""
  }
}

resource "snowflake_grant_privileges_to_account_role" "table_select_grant" {
  privileges        = ["SELECT"]
  account_role_name = snowflake_role.role.name
  on_schema_object {
    object_type = "TABLE"
    object_name = "\"${var.database_name}\".\"${var.schema_name}\".\"${var.table_name}\""
  }
}
