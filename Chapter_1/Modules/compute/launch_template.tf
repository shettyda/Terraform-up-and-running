resource "aws_launch_template" "web" {
  name          = "Terra_up_running"
  instance_type = var.instance_type
  image_id      = var.ami_id
  user_data     = base64encode(file("${path.module}/user_data.sh"))

  network_interfaces {
    security_groups             = var.security_group_ids
    associate_public_ip_address = true
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "Terra_web"
    }
  }
}