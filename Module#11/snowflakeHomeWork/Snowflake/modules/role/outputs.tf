output "role_name" {
  description = "The name of the created Snowflake role"
  value       = snowflake_role.role.name
}
