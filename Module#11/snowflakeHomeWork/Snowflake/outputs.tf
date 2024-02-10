/*
Outputs defined in modules are only visible outside the module if they are explicitly referenced in the root module or another calling module.
*/

output "created_warehouse_name" {
  description = "The name and size of the Snowflake warehouse created by the warehouse module"
  value       = "${module.warehouse.warehouse_name} / ${module.warehouse.warehouse_size}"
}

output "created_database_name" {
  description = "The name of the Snowflake database created by the database module"
  value       = module.database.database_name
}

output "created_table_name" {
  description = "The name of the Snowflake table created by the table module"
  value       = module.table.table_fully_qualified_name
}

output "created_schema_name" {
  description = "The name of the Snowflake schema created by the schema module"
  value       = module.schema.schema_name
}

output "created_role_name" {
  description = "The name of the Snowflake role created by the role module"
  value       = module.role.role_name
}
