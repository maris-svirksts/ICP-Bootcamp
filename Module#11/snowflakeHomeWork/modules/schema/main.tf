resource "snowflake_schema" "schema" {
  name     = var.schema_name
  database = var.database_name
  comment  = var.schema_comment
}
