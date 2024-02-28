variable "tfstate_bucket_name" {
  description = "The name of the tfstate S3 bucket to be created. Only lowercase alphanumeric characters and hyphens allowed."
  type        = string
  default     = "terraform-state"
}

variable "common_tags" {
  description = "Common tags for all resources"
  type        = map(string)
  default     = {
    Name = "Maris Svirksts"
  }
}
