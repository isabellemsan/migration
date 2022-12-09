resource "aws_route_table" "public_route" {
  vpc_id = aws_vpc.on_prem_dc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.migration_gw.id

  }

  tags = {
    Name = "public route"
  }
}

resource "aws_route_table" "private_route" {
  vpc_id = aws_vpc.on_prem_dc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.migration_nat.id

  }

  tags = {
    Name = "private route"
  }
}

resource "aws_route_table_association" "public_route_assoc" {
  subnet_id      = aws_subnet.onprem_public_subnet.id
  route_table_id = aws_route_table.public_route.id
}

resource "aws_route_table_association" "private_route_assoc" {
  subnet_id      = aws_subnet.onprem_private_subnet.id
  route_table_id = aws_route_table.private_route.id
}

