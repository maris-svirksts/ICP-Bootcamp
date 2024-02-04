# Terraform: Practical Work within Lecture, Lab 2.

## The Task
Update your existing Terraform configuration with:
1. Backend block s3 (configure the backend storage for terraform.tfstate)
2. Data block for ami (use data block to filter ami images to avoid hardcoding)
3. Resources SG + EC2 (use dependencies to attach ec2 instance to created security group)
4. Variables and Outputs (use variables and create an output, that shows ec2 public ip after the deployment)

## The Result

#### **`shell`**
```bash
terraform init
terraform plan
terraform apply
terraform destroy
```

#### **`providers.tf` - Preparation: create a bucket for terraform.tfstate**
```python
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

/*
variable "rules" {
  default = [
    {
      port        = 22
      proto       = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      port        = 80
      proto       = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      port        = 443
      proto       = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      port        = 3306
      proto       = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}
*/

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_security_group" "maris_svirksts_terraform_security" {
  name        = "maris-svirksts-terraform-security-group"
  description = "Security group for module 9: Terraform"

  /*
  # Dynamic, V1
  dynamic "ingress" {
    for_each = var.rules
    content {
      from_port   = ingress.value["port"]
      to_port     = ingress.value["port"]
      protocol    = ingress.value["proto"]
      cidr_blocks = ingress.value["cidrs"]
    }
  }
  */

  # Dynamic, V2
  dynamic "ingress" {
    for_each = ["22", "80", "443", "3306"]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  /*
  # Manual
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  */

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "created_instance" {
  ami             = data.aws_ami.amazon_linux.id
  instance_type   = "t3.micro"
  vpc_security_group_ids = [aws_security_group.maris_svirksts_terraform_security.id]

  tags = {
    Name = "Maris Svirksts / Terraform"
  }
}

output "ec2_instance_public_ip" {
  description = "The public IP address of the created instance"
  value       = aws_instance.created_instance.public_ip
}
```