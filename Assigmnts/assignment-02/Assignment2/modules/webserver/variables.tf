variable "env_prefix" {
  description = "Environment prefix"
  type        = string
}

variable "instance_name" {
  description = "EC2 instance name"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "availability_zone" {
  description = "Availability Zone"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
}

variable "security_group_id" {
  description = "Security group ID"
  type        = string
}

variable "public_key" {
  description = "Path to public SSH key"
  type        = string
}

variable "script_path" {
  description = "User data script path"
  type        = string
}

variable "instance_suffix" {
  description = "Unique suffix for instance"
  type        = string
}

variable "common_tags" {
  description = "Common resource tags"
  type        = map(string)
}
