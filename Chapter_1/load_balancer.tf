resource "aws_lb" "lb" {
  name               = "Terra-LB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.terra_lb_sg.id]
  subnets            = [aws_subnet.lb_subnet.id, aws_subnet.terra_subnet.id]

  tags = {
    Environment = "Learning"
  }

}


