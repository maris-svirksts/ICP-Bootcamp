resource "aws_security_group" "udemy_webaccess" {
  name        = "WebAccess - Udemy"
  vpc_id      = aws_vpc.terraform_vpc1.id
  description = "Udemy, VPC, P45"

  dynamic "ingress" {
    for_each = [22, 80, 443]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "udemy_noWebaccess" {
  name        = "No WebAccess - Udemy"
  vpc_id      = aws_vpc.terraform_vpc1.id
  description = "Udemy, VPC, P45"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group_rule" "icmp" {
  source_security_group_id = aws_security_group.udemy_webaccess.id
  security_group_id        = aws_security_group.udemy_noWebaccess.id
  type                     = "ingress"
  protocol                 = "icmp"
  from_port                = -1
  to_port                  = -1
  description              = "Udemy, VPC, P45"
}

resource "aws_security_group" "udemy_allow_all" {
  name        = "Allow All - Udemy"
  vpc_id      = aws_vpc.terraform_vpc1.id
  description = "Udemy, VPC, P48"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
