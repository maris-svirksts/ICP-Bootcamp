variable "region" {
  description = "AWS Region"
  type        = string
  default     = "eu-north-1"
}

variable "vpc_cidr1" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_cidr2" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "List of availability zones in the region"
  type        = list(string)
  default     = ["eu-north-1a", "eu-north-1b", "eu-north-1c"]
}

variable "peer_owner_id" {
  description = "AWS account ID"
  type        = string
}

variable "common_tags" {
  description = "Common tags for all resources"
  type        = map(string)
  default = {
    "Project"     = "Setup"
    "Environment" = "Development"
  }
}
