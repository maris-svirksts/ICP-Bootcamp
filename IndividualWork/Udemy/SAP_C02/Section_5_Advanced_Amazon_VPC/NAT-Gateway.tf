# Elastic IP for the NAT Gateway
resource "aws_eip" "nat" {
  domain = "vpc"
}

# NAT Gateway associated with a public subnet
resource "aws_nat_gateway" "example" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_subnet1.1.id

  tags = {
    Name = "Example NAT Gateway"
  }

  depends_on = [ aws_internet_gateway.website_igw ]
}

# Route to direct internet-bound traffic from the private subnet to the NAT Gateway
resource "aws_route" "private_nat" {
  route_table_id         = aws_route_table.private_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.example.id
}
