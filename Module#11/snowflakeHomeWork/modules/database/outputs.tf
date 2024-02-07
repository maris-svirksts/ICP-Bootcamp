output "database_name" {
  description = "The name of the created Snowflake database"
  value       = snowflake_database.database.name
}
