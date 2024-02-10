variable "database_name" {
  description = "The name of the Snowflake database to be created"
  type        = string
}

variable "database_comment" {
  description = "An optional comment for the database"
  type        = string
  default     = ""
}
