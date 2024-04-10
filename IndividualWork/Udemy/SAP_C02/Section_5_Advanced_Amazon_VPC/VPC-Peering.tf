resource "aws_vpc_peering_connection" "foo" {
peer_owner_id = "058264170770" # Needs to be a string. Number fails.
  peer_vpc_id = aws_vpc.terraform_vpc1.id
  vpc_id      = aws_vpc.terraform_vpc2.id
  auto_accept = true

  tags = {
    Name = "VPC Peering between VPC1 and VPC2"
  }
}
