resource "aws_subnet" "onprem_public_subnet" {
  vpc_id            = aws_vpc.on_prem_dc.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "eu-central-1a"

  tags = {
    Name = "onprem_public"
  }
}

resource "aws_subnet" "onprem_private_subnet" {
  vpc_id            = aws_vpc.on_prem_dc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "eu-central-1a"
  tags = {
    Name = "onprem_private"
  }
}