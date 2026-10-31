resource "aws_autoscaling_group" "lb_as_group" {
  name                = "LB-AutoScaling-Group"
  min_size            = var.min_instance
  max_size            = var.max_instance
  desired_capacity    = var.desired_instance
  vpc_zone_identifier = var.subnet_id
  target_group_arns   = var.target_group_arn

  health_check_type ="ALB"
  health_check_grace_period = 5

  launch_template {
    id      = aws_launch_template.web.id
    version = "$Latest"
  }

}