output "table_fully_qualified_name" {
  description = "The fully qualified name of the created Snowflake table"
  value       = "${snowflake_table.table.database}.${snowflake_table.table.schema}.${snowflake_table.table.name}"
}
