output "schema_name" {
  description = "The name of the created Snowflake schema"
  value       = snowflake_schema.schema.name
}
