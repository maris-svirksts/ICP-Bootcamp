/*
Local values (defined within a locals block) are a way to simplify or organize Terraform code by
assigning names to intermediate values. These values can then be reused throughout your Terraform
configuration, making the configuration more readable, maintainable, and reducing repetition.
*/

locals {
  workspace_prefix = terraform.workspace

  dynamic_warehouse_name = "${local.workspace_prefix}_${var.warehouse_name}"
  dynamic_database_name  = "${local.workspace_prefix}_${var.database_name}"
  dynamic_role_name      = "${local.workspace_prefix}_${var.role_name}"

  dynamic_snowflake_account          = var.snowflake_account
  dynamic_snowflake_user             = var.snowflake_user
  dynamic_snowflake_role             = var.snowflake_role
  dynamic_snowflake_private_key_path = var.snowflake_private_key_path
  dynamic_warehouse_size             = var.warehouse_size
  dynamic_auto_suspend               = var.auto_suspend
  dynamic_auto_resume                = var.auto_resume
  dynamic_initially_suspended        = var.initially_suspended
  dynamic_schema_name                = var.schema_name
  dynamic_table_name                 = var.table_name
  dynamic_table_columns              = var.table_columns
  dynamic_role_privileges            = var.role_privileges
}
