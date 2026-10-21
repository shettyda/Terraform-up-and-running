output "lb_arn" {
  description = "ARN of the loadbalancer"
  value       = aws_lb.lb.arn
}

output "lb_dns_name" {
  description = "DNS name of the load balancer"
  value       = aws_lb.lb.dns_name
}

output "target_group_arn" {
  description = "ARN of the target group"
  value       = aws_lb_target_group.lb_tg.arn
}

output "listener_arn" {
  description = "ARN of the listener"
  value       = aws_lb_listener.lb_listener_rule.arn
}
