output "nginx_sg_id" {
  description = "Nginx security group ID"
  value       = aws_security_group.nginx_sg.id
}

output "backend_sg_id" {
  description = "Backend security group ID"
  value       = aws_security_group.backend_sg.id
}
