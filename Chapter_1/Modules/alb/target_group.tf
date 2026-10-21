resource "aws_lb_target_group" "lb_tg" {
  name     = var.lb_target_group_name
  port     = var.lb_target_group_port
  protocol = var.target_group_protocal
  vpc_id   = var.vpc_id

  #resource "aws_vpc" "terra_vpc" {
  # cidr_block = "10.0.0.0/16" 
  #}

  # HealthCheck 

  health_check {
    path                = var.health_check_path
    interval            = 10
    matcher             = "200"
    protocol            = "HTTP"
    timeout             = 3
    healthy_threshold   = 2
    unhealthy_threshold = 3

  }

}