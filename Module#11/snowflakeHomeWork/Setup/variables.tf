variable "tfstate_bucket_name" {
  description = "The name of the tfstate S3 bucket to be created. Only lowercase alphanumeric characters and hyphens allowed."
  type        = string
  default     = "terraform-state"
}
