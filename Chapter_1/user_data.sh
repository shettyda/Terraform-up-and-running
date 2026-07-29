#!/bin/bash
cd /home/ec2-user
echo "Terraform Up and Learning" > index.html
sudo nohup python3 -m http.server 80 > nohup.out 2>&1 &
disown