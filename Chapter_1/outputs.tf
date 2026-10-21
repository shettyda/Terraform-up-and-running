output "alb_dns_name" {
  description = "URL to test the load balancer"
  value       = module.alb.lb_dns_name
}
