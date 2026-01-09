variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string

  validation {
    condition     = can(regex("^([0-9]{1,3}\\.){3}[0-9]{1,3}/[0-9]+$", var.vpc_cidr_block))
    error_message = "Please provide a valid CIDR block for VPC."
  }
}

variable "subnet_cidr_block" {
  description = "CIDR block for the subnet"
  type        = string

  validation {
    condition     = can(regex("^([0-9]{1,3}\\.){3}[0-9]{1,3}/[0-9]+$", var.subnet_cidr_block))
    error_message = "Please provide a valid CIDR block for subnet."
  }
}

variable "availability_zone" {
  description = "Availability zone for resources"
  type        = string
}

variable "env_prefix" {
  description = "Environment prefix for resource naming"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "public_key" {
  description = "Path to public SSH key"
  type        = string
}

variable "private_key" {
  description = "Path to private SSH key"
  type        = string
}

variable "backend_servers" {
  description = "List of backend servers"
  type = list(object({
    name        = string
    script_path = string
  }))
}
