resource "aws_autoscaling_group" "lb_as_group" {
  name                = "LB-AutoScaling-Group"
  min_size            = 2
  max_size            = 4
  desired_capacity    = 2
  vpc_zone_identifier = [aws_subnet.terra_subnet.id, aws_subnet.lb_subnet.id]
  target_group_arns   = [aws_lb_target_group.lb_tg.arn]

  launch_template {
    id      = aws_launch_template.web.id
    version = "$Latest"
  }

}