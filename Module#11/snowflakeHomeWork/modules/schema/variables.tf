variable "schema_name" {
  description = "The name of the Snowflake schema to be created"
  type        = string
}

variable "database_name" {
  description = "The name of the Snowflake database in which the schema will be created"
  type        = string
}

variable "schema_comment" {
  description = "An optional comment on the schema"
  type        = string
  default     = ""
}
