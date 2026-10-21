output "instance_sg_id" {
  description = "Security group ID for the instances"
  value       = aws_security_group.terra_instance_sg.id
}

output "lb_sg_id" {
  description = "Security group ID for the load balancer"
  value       = aws_security_group.terra_lb_sg.id
}