output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.this.id
}

output "subnet_id" {
  description = "Subnet ID"
  value       = aws_subnet.this.id
}

output "igw_id" {
  description = "Internet Gateway ID"
  value       = aws_internet_gateway.this.id
}

output "route_table_id" {
  description = "Route Table ID"
  value       = aws_route_table.this.id
}
