module "warehouse" {
  source              = "./modules/warehouse"
  warehouse_name      = local.dynamic_warehouse_name
  warehouse_size      = local.dynamic_warehouse_size
  auto_suspend        = local.dynamic_auto_suspend
  auto_resume         = local.dynamic_auto_resume
  initially_suspended = local.dynamic_initially_suspended
}

module "database" {
  source           = "./modules/database"
  database_name    = local.dynamic_database_name
  database_comment = "This is an example database."
}

module "schema" {
  source         = "./modules/schema"
  schema_name    = local.dynamic_schema_name
  database_name  = local.dynamic_database_name
  depends_on     = [module.database]
  schema_comment = "This is an example schema."
}

module "table" {
  source        = "./modules/table"
  table_name    = local.dynamic_table_name
  schema_name   = local.dynamic_schema_name
  database_name = local.dynamic_database_name
  table_columns = local.dynamic_table_columns
  depends_on    = [module.schema]
  table_comment = "This table stores example data."
}

module "role" {
  source          = "./modules/role"
  role_name       = local.dynamic_role_name
  database_name   = local.dynamic_database_name
  schema_name     = local.dynamic_schema_name
  warehouse_name  = local.dynamic_warehouse_name
  table_name      = local.dynamic_table_name
  role_privileges = local.dynamic_role_privileges
  depends_on      = [module.table]
  role_comment    = "This role accesses the table created before."
}
