resource "aws_vpc" "terraform_vpc1" {
  cidr_block = var.vpc_cidr1

  assign_generated_ipv6_cidr_block = true

  tags = merge(
    var.common_tags,
    {
      "Name" = "Udemy VPC 1"
    }
  )
}

resource "aws_subnet" "public_subnet1" {
  count                           = length(var.availability_zones)
  vpc_id                          = aws_vpc.terraform_vpc1.id
  cidr_block                      = cidrsubnet(var.vpc_cidr1, 8, count.index)
  ipv6_cidr_block                 = cidrsubnet(aws_vpc.terraform_vpc1.ipv6_cidr_block, 8, count.index)
  assign_ipv6_address_on_creation = true # Auto asign.
  availability_zone               = var.availability_zones[count.index]
  map_public_ip_on_launch         = true

  tags = merge(
    var.common_tags,
    {
      "Name" = "Public Subnet ${count.index + 1}"
    }
  )
}

resource "aws_subnet" "private_subnet1" {
  count                   = length(var.availability_zones)
  vpc_id                  = aws_vpc.terraform_vpc1.id
  cidr_block              = cidrsubnet(var.vpc_cidr1, 8, count.index + length(var.availability_zones)) # So that the subnets do not overlap.
  ipv6_cidr_block         = cidrsubnet(aws_vpc.terraform_vpc1.ipv6_cidr_block, 8, count.index + length(var.availability_zones))
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = false

  tags = merge(
    var.common_tags,
    {
      "Name" = "Private Subnet ${count.index + 1}"
    }
  )
}
