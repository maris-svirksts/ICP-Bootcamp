variable "role_name" {
  description = "The name of the Snowflake role to be created"
  type        = string
}

variable "role_comment" {
  description = "An optional comment for the role"
  type        = string
  default     = ""
}

variable "database_name" {
  description = "The name of the database on which the role will have privileges"
  type        = string
}

variable "schema_name" {
  description = "The name of the schema within the database on which the role will have privileges"
  type        = string
}

variable "role_privileges" {
  description = "A list of privileges that the role will have on the schema"
  type        = list(string)
  default     = ["USAGE", "SELECT"]
}

variable "warehouse_name" {
  description = "Name of the Snowflake warehouse to be created"
  type        = string
}

variable "table_name" {
  description = "The name of the Snowflake table to be created"
  type        = string
}