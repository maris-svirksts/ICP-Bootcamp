resource "snowflake_database" "database" {
  name    = var.database_name
  comment = var.database_comment
}
