# Create a Network Access Control List
resource "aws_network_acl" "example_nacl" {
  vpc_id = aws_vpc.terraform_vpc1.id

  tags = {
    Name = "example-nacl"
  }
}

# Allow inbound HTTP traffic
resource "aws_network_acl_rule" "inbound_http" {
  network_acl_id = aws_network_acl.example_nacl.id
  rule_number    = 100
  rule_action    = "allow"
  egress         = false  # false for inbound rules
  protocol       = "-1"
  from_port      = 0
  to_port        = 0
  cidr_block     = "0.0.0.0/0"
}

# Allow outbound traffic
resource "aws_network_acl_rule" "outbound_all" {
  network_acl_id = aws_network_acl.example_nacl.id
  rule_number    = 100
  rule_action    = "allow"
  egress         = true  # true for outbound rules
  protocol       = "-1"  # -1 for all protocols
  from_port      = 0
  to_port        = 0
  cidr_block     = "0.0.0.0/0"
}

# Deny inbound traffic from a specific IP range
resource "aws_network_acl_rule" "deny_inbound" {
  network_acl_id = aws_network_acl.example_nacl.id
  rule_number    = 90
  rule_action    = "deny"
  egress         = false
  protocol       = "-1"  # -1 for all protocols
  from_port      = 0
  to_port        = 0
  cidr_block     = "199.168.1.0/24"
}
