variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "subnet_cidr_block" {
  description = "CIDR block for the public subnet"
  type        = string
}

variable "availability_zone" {
  description = "Availability zone for subnet"
  type        = string
}

variable "env_prefix" {
  description = "Environment prefix for naming"
  type        = string
}

variable "common_tags" {
  description = "Common tags for resources"
  type        = map(string)
}
