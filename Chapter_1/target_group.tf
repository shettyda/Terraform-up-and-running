resource "aws_lb_target_group" "lb_tg" {
  name     = "lb-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.terra_vpc.id

  #resource "aws_vpc" "terra_vpc" {
  # cidr_block = "10.0.0.0/16" 
  #}

  # HealthCheck 

  health_check {
    path                = "/"
    interval            = 10
    matcher             = "200"
    protocol            = "HTTP"
    timeout             = 3
    healthy_threshold   = 2
    unhealthy_threshold = 3

  }

}