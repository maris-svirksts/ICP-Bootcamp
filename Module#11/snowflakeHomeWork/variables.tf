variable "snowflake_account" {
  description = "Snowflake account identifier"
  type        = string
}

variable "snowflake_user" {
  description = "Username for Snowflake login"
  type        = string
}

variable "snowflake_role" {
  description = "Role to assume upon login"
  type        = string
  default     = "PUBLIC"
}

variable "snowflake_private_key_path" {
  description = "Path to the PEM-formatted private key file for Snowflake authentication."
  type        = string
  sensitive   = true
}


variable "warehouse_name" {
  description = "The name of the Snowflake warehouse to be created."
  type        = string
  default     = "my_warehouse"
}

variable "warehouse_size" {
  description = "Size of the Snowflake warehouse."
  type        = string
  default     = "X-SMALL"
}

variable "auto_suspend" {
  description = "Number of seconds of inactivity after which the warehouse is automatically suspended."
  type        = number
  default     = 300
}

variable "auto_resume" {
  description = "Specifies whether the warehouse should be automatically resumed when a query is submitted."
  type        = bool
  default     = true
}

variable "initially_suspended" {
  description = "Specifies whether the warehouse is created in a suspended state."
  type        = bool
  default     = true
}

variable "database_name" {
  description = "The name of the Snowflake database to be created."
  type        = string
  default     = "my_database"
}

variable "schema_name" {
  description = "The name of the schema within the Snowflake database."
  type        = string
  default     = "my_schema"
}

variable "table_name" {
  description = "The name of the table to be created within the schema."
  type        = string
  default     = "my_table"
}

variable "table_columns" {
  description = "A map of column names to Snowflake data types."
  type        = map(string)
  default = {
    "id"         = "INTEGER",
    "name"       = "VARCHAR(255)",
    "created_at" = "TIMESTAMP",
    "is_active"  = "BOOLEAN"
  }
}

variable "role_name" {
  description = "The name of the Snowflake role to be created."
  type        = string
  default     = "my_role"
}

variable "role_privileges" {
  description = "The privileges assigned to the role."
  type        = list(string)
  default     = ["USAGE", "SELECT"]
}

