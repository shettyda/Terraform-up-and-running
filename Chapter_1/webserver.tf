#Create Key Pair for for EC2 Instance

resource "aws_key_pair" "terra_up_running" {
  key_name   = "terra_up_running"
  public_key = file("/home/shettyda/.ssh/id_ed25519.pub")
}



resource "aws_instance" "web" {
  launch_template {
    id      = aws_launch_template.web.id
    version = "$Latest"
  }
}


