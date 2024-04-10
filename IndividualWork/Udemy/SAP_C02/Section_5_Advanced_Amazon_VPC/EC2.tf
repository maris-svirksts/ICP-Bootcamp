variable "user_data" {
  default = <<-EOF
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y apache2
    sudo systemctl start apache2
    sudo systemctl enable apache2
    sudo echo "The page was created by Maris Svirksts" > /var/www/html/index.html
  EOF
}

data "aws_ami" "ubuntu_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}



resource "aws_instance" "public_instance" {
  ami                    = data.aws_ami.ubuntu_linux.id
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.udemy_webaccess.id]
  subnet_id              = aws_subnet.public_subnet1.0.id
  user_data              = var.user_data

  tags = {
    Name = "Public Instance / Udemy VPC"
  }
}

resource "aws_instance" "private_instance" {
  ami                    = data.aws_ami.ubuntu_linux.id
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.udemy_noWebaccess.id]
  subnet_id              = aws_subnet.private_subnet1.0.id
  key_name               = "Temp_Udemy"

  tags = {
    Name = "Private Instance / Udemy VPC"
  }
}
