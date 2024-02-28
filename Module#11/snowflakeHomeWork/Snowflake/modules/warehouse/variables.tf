variable "warehouse_name" {
  description = "Name of the Snowflake warehouse to be created"
  type        = string
  default     = "Test"
}

variable "warehouse_size" {
  description = "Size of the Snowflake warehouse"
  type        = string
  default     = "X-SMALL"
}

variable "auto_suspend" {
  description = "Number of seconds of inactivity after which the warehouse is automatically suspended"
  type        = number
  default     = 300
}

variable "auto_resume" {
  description = "Specifies whether the warehouse should be automatically resumed when a query is submitted"
  type        = bool
  default     = true
}

variable "initially_suspended" {
  description = "Specifies whether the warehouse is created in a suspended state"
  type        = bool
  default     = false
}

variable "warehouse_comment" {
  description = "An optional comment for the warehouse"
  type        = string
  default     = ""
}
