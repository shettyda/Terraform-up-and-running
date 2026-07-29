resource "aws_launch_template" "web" {
  name          = "Terra_up_running"
  instance_type = "t2.micro"
  image_id      = "ami-09d88f7c4c272b0c5"
  key_name      = aws_key_pair.terra_up_running.key_name
  user_data     = base64encode(file("user_data.sh"))

  network_interfaces {
    subnet_id                   = aws_subnet.lb_subnet.id
    security_groups             = [aws_security_group.terra_lb_sg.id]
    associate_public_ip_address = true
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "Terra_web"

    }

  }
}