variable "database_name" {
  description = "The name of the Snowflake database in which the table will be created"
  type        = string
}

variable "schema_name" {
  description = "The name of the Snowflake schema in which the table will be created"
  type        = string
}

variable "table_name" {
  description = "The name of the Snowflake table to be created"
  type        = string
}

variable "table_comment" {
  description = "An optional comment for the table"
  type        = string
  default     = ""
}

variable "table_columns" {
  description = "A map of column names to Snowflake data types for the table"
  type        = map(string)
  default     = {}
}
