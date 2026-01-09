variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "env_prefix" {
  description = "Environment prefix"
  type        = string
}

variable "my_ip" {
  description = "My public IP with /32"
  type        = string
}

variable "common_tags" {
  description = "Common tags for resources"
  type        = map(string)
}
