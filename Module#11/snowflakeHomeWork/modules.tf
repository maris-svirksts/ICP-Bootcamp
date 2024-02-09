module "warehouse" {
  source              = "./modules/warehouse"
  warehouse_name      = var.warehouse_name
  warehouse_size      = var.warehouse_size
  auto_suspend        = var.auto_suspend
  auto_resume         = var.auto_resume
  initially_suspended = var.initially_suspended
}

module "database" {
  source           = "./modules/database"
  database_name    = var.database_name
  database_comment = "This is an example database."
}

module "schema" {
  source         = "./modules/schema"
  schema_name    = var.schema_name
  database_name  = var.database_name
  depends_on     = [module.database]
  schema_comment = "This is an example schema."
}

module "table" {
  source        = "./modules/table"
  table_name    = var.table_name
  schema_name   = var.schema_name
  database_name = var.database_name
  table_columns = var.table_columns
  depends_on    = [module.schema]
  table_comment = "This table stores example data."
}

module "role" {
  source          = "./modules/role"
  role_name       = var.role_name
  database_name   = var.database_name
  schema_name     = var.schema_name
  warehouse_name  = var.warehouse_name
  table_name      = var.table_name
  role_privileges = ["USAGE", "SELECT"] # Hard coded at the moment, need to find a way to do dynamic
  depends_on      = [module.table]
  role_comment    = "This role accesses the table created before."
}
