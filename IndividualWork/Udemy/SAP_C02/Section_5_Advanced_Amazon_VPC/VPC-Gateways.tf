# Gateway Endpoint for Amazon S3
resource "aws_vpc_endpoint" "s3_endpoint" {
  vpc_id            = aws_vpc.terraform_vpc1.id
  service_name      = "com.amazonaws.${var.region}.s3"
  vpc_endpoint_type = "Gateway"

  route_table_ids = [aws_route_table.public_route_table.id, aws_route_table.private_route_table.id]

  tags = {
    Name = "s3-vpc-endpoint"
  }
}

# Gateway Endpoint for Amazon DynamoDB
resource "aws_vpc_endpoint" "dynamodb_endpoint" {
  vpc_id            = aws_vpc.terraform_vpc1.id
  service_name      = "com.amazonaws.${var.region}.dynamodb"
  vpc_endpoint_type = "Gateway"

  route_table_ids = [aws_route_table.public_route_table.id, aws_route_table.private_route_table.id]

  tags = {
    Name = "dynamodb-vpc-endpoint"
  }
}

# Interface Endpoint (Various)
resource "aws_vpc_endpoint" "ec2_endpoint" {
  vpc_id            = aws_vpc.terraform_vpc1.id
  service_name      = "com.amazonaws.${var.region}.ec2"
  vpc_endpoint_type = "Interface"

  subnet_ids = [aws_subnet.private_subnet1[0].id]

  security_group_ids = [aws_security_group.udemy_noWebaccess.id]

  tags = {
    Name = "ec2-vpc-endpoint"
  }
}
