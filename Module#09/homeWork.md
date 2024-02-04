# Terraform: Homework, based on Lab 2.

## The Task
Modify the Terraform configuration with:
1. Built-in function (as an example: filebase64 for ec2 userdata)
2. Dynamic blocks/s

## The Result

#### **`shell`**
```bash
terraform init
terraform plan
terraform apply
terraform destroy
```

#### **`providers.tf` - Preparation: create a bucket for terraform.tfstate**
```bash
terraform {
    required_providers {
        aws = {
            version = "=5.34.0"
        }
    }
}

provider "aws" {
    region = "eu-north-1"
}

#terraform.tfstate
resource "aws_s3_bucket" "tfstate" {
  bucket = "maris-svirksts-terraform-state"
}
```

#### **`main.tf`**
```python
terraform {
  required_providers {
    aws = {
      version = "=5.34.0"
    }
  }
  backend "s3" {
    bucket = "maris-svirksts-terraform-state"
    region = "eu-north-1"
    key    = "terraform.tfstate"
  }
}

provider "aws" {
  region = "eu-north-1"
}

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

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

resource "aws_security_group" "maris_svirksts_terraform_security" {
  name        = "maris-svirksts-terraform-security-group-${terraform.workspace}"
  description = "Security group for module 9: Terraform"

  dynamic "ingress" {
    for_each = [22, 80, 443, 3306]
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

resource "aws_instance" "created_instance" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.maris_svirksts_terraform_security.id]

  tags = {
    Name = "Maris Svirksts / Terraform"
  }

  user_data_base64 = base64encode(var.user_data)
}

output "ec2_instance_public_ip" {
  description = "The public IP address of the created instance"
  value       = aws_instance.created_instance.public_ip
}
```