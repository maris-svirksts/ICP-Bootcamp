resource "aws_internet_gateway" "website_igw" {
  vpc_id = aws_vpc.terraform_vpc1.id

  tags = merge(
    var.common_tags,
    {
      "Name" = "Udemy VPC Internet Gateway"
    }
  )
}
