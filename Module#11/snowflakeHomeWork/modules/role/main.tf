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

resource "snowflake_warehouse_grant" "warehouse_grant" {
  warehouse_name = var.warehouse_name
  privilege     = "USAGE"
  roles         = [snowflake_role.role.name]
}

resource "snowflake_database_grant" "database_grant" {
  database_name = var.database_name
  privilege     = "USAGE"
  roles         = [snowflake_role.role.name]
  depends_on    = [snowflake_role.role]
}

resource "snowflake_schema_grant" "schema_grant" {
  schema_name   = var.schema_name
  database_name = var.database_name
  privilege     = "USAGE"
  roles         = [snowflake_role.role.name]
}

resource "snowflake_table_grant" "table_select_grant" {
  table_name    = var.table_name
  schema_name   = var.schema_name
  database_name = var.database_name
  privilege     = "SELECT"
  roles         = [snowflake_role.role.name]
}
