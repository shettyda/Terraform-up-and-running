resource "aws_lb" "lb" {
  name               = "Terra-LB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.lb_security_group
  subnets            = var.lb_subnet_ids

  tags = {
    Environment = "Learning"
  }
}