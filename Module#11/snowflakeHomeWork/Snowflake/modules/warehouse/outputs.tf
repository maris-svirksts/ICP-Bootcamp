output "warehouse_name" {
  description = "The name of the created Snowflake warehouse"
  value       = snowflake_warehouse.warehouse.name
}

output "warehouse_size" {
  description = "The size of the created Snowflake warehouse"
  value       = snowflake_warehouse.warehouse.warehouse_size
}
