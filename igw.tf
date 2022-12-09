resource "aws_internet_gateway" "migration_gw" {
  vpc_id = aws_vpc.on_prem_dc.id

  tags = {
    Name = var.igw_name
  }
}
resource "aws_eip" "allocation_eip" {
  vpc = true
}

resource "aws_nat_gateway" "migration_nat" {

  allocation_id     = aws_eip.allocation_eip.id
  subnet_id         = aws_subnet.onprem_public_subnet.id
  connectivity_type = "public"

  tags = {
    Name = var.nat_gw_name
  }
  depends_on = [aws_internet_gateway.migration_gw]
}
