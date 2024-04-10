resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.terraform_vpc1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.website_igw.id
  }

  route {
    ipv6_cidr_block = "::/0"
    gateway_id      = aws_internet_gateway.website_igw.id
  }

  tags = merge(
    var.common_tags,
    {
      "Name" = "Udemy Public Route Table"
    }
  )
}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.terraform_vpc1.id

  route = []

  tags = merge(
    var.common_tags,
    {
      "Name" = "Udemy Private Route Table"
    }
  )
}

resource "aws_route_table_association" "public_rta" {
  count          = length(aws_subnet.public_subnet1.*.id)
  subnet_id      = aws_subnet.public_subnet1[count.index].id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "private_rta" {
  count          = length(aws_subnet.private_subnet1.*.id)
  subnet_id      = aws_subnet.private_subnet1[count.index].id
  route_table_id = aws_route_table.private_route_table.id
}
