terraform {
  required_providers {
    snowflake = {
      source = "Snowflake-Labs/snowflake"
    }
  }
}

resource "snowflake_table" "table" {
  database = var.database_name
  schema   = var.schema_name
  name     = var.table_name
  comment  = var.table_comment

  # Dynamically create columns based on var.table_columns map
  dynamic "column" {
    for_each = var.table_columns
    content {
      name = column.key
      type = column.value
    }
  }
}
