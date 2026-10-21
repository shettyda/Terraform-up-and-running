
output "vpc_id" {
  value = aws_vpc.terra_vpc.id
}

output "subnet_ids" {
  value = [aws_subnet.terra_subnet.id, aws_subnet.lb_subnet.id]
}