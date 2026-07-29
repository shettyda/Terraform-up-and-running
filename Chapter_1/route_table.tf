resource "aws_route_table" "terra_route_table" {
  vpc_id = aws_vpc.terra_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terra_igw.id
  }

}

# ROUTE TABLE ASSOCIATION FOR *** terra_subnet ***

resource "aws_route_table_association" "terra_route_table_association" {
  subnet_id      = aws_subnet.terra_subnet.id
  route_table_id = aws_route_table.terra_route_table.id
}

# ROUTE TABLE ASSOCIATION FOR *** lb_subnet ***

resource "aws_route_table_association" "terra_lb_route_table_association" {
  subnet_id      = aws_subnet.lb_subnet.id
  route_table_id = aws_route_table.terra_route_table.id
}