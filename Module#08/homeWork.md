# AWS / Advanced: Homework.

## The Tasks
Task 1:
1. Create 2 instances using the autoscaling group and attach it to a load balancer.

Task 2:
1. Create two backets, create a folder and a file in one. Then write a Lambda function that will copy the data to the second bucket.
2. Write a Lambda function in python. And also attach a API Trigger endpoint to show that the task is done

## Task 1: The Result
```terraform
# Define required Terraform version and required providers
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws" # Specify AWS provider source
      version = "5.36.0"        # Specify AWS provider version
    }
  }
}

# Configure the AWS provider with the desired region
provider "aws" {
  region = "eu-north-1" # AWS region where resources will be created
}

# Define a variable for user data to configure EC2 instances with unique content
variable "user_data" {
  default = <<-EOF
    #!/bin/bash
    sudo apt update
    sudo apt install -y apache2
    sudo systemctl start apache2
    sudo systemctl enable apache2
    INSTANCE_ID=$(curl http://169.254.169.254/latest/meta-data/instance-id)
    echo "This page was created by Terraform on instance: $INSTANCE_ID" | sudo tee /var/www/html/index.html
  EOF
  # Bash script for initial setup of the EC2 instance. It updates packages, installs Apache2, and displays a unique page. Uses https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instancedata-data-retrieval.html to identify instance.
}

# Define a variable for subnets to be used by the load balancer
variable "subnets" {
  type    = list(string)
  default = ["subnet-0889edac37ed78cd8", "subnet-03750949ad64b4a2c", "subnet-033f1ce42151d473d"]
  # List of subnet IDs for the ALB, ensuring high availability across multiple zones
}

# Define a variable for the VPC ID where resources will be deployed
variable "vpc_id" {
  type    = string
  default = "vpc-0b27c4969800d8fd0"
  # The ID of the VPC where the load balancer and instances are located
}

# Fetch the latest Ubuntu AMI information for instance creation
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
    # Filter to select the latest Ubuntu 22.04 LTS AMI
  }

  owners = ["amazon"] # The AWS account name of the AMI owner
}

# Define launch configuration for EC2 instances using the AMI and user data
resource "aws_launch_configuration" "micro" {
  name_prefix     = "terraform-lc-example-"
  image_id        = data.aws_ami.ubuntu.id
  instance_type   = "t3.micro" # Specifies the size of the instance
  user_data       = var.user_data
  security_groups = [aws_security_group.alb_sg.id] # Associates instances with the defined security group

  lifecycle {
    create_before_destroy = true # Minimizes downtime during update or replacement
  }
}

# Define an Auto Scaling Group to manage EC2 instances
resource "aws_autoscaling_group" "bar" {
  name                 = "terraform-asg-example"
  launch_configuration = aws_launch_configuration.micro.name
  min_size             = 1
  max_size             = 3
  desired_capacity     = 2
  availability_zones   = ["eu-north-1a", "eu-north-1b", "eu-north-1c"]
  # Configures scaling parameters and distributes instances across 3 zones for high availability

  target_group_arns = [aws_lb_target_group.asg.arn]

  lifecycle {
    create_before_destroy = true
  }
}

# Create an Application Load Balancer to distribute incoming traffic
resource "aws_lb" "my_alb" {
  name               = "my-alb-example"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = var.subnets

  enable_deletion_protection = false # Allows the ALB to be deleted without manual intervention
}

# Create a security group for the ALB, allowing inbound HTTP traffic
resource "aws_security_group" "alb_sg" {
  name        = "alb-sg"
  description = "Allow port 80 to ALB"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    # Allows all inbound HTTP traffic
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    # Allows all outbound traffic
  }
}

# Define a target group for routing requests to the appropriate instances
resource "aws_lb_target_group" "asg" {
  name     = "my-tg-example"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  # Configures health checks for ensuring instances are healthy before routing traffic
  health_check {
    enabled  = true
    path     = "/"
    protocol = "HTTP"
  }
}

# Add a listener to the ALB for processing incoming HTTP traffic
resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.my_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.asg.arn
    # Directs traffic to the target group
  }
}

# Output the DNS name of the ALB for accessing the application
output "alb_dns_name" {
  value       = aws_lb.my_alb.dns_name
  description = "The DNS name of the ALB"
  # Provides a URL for accessing the load-balanced application
}
```

## Task 2: The Result
```python
import boto3
import json


def save_file_data():
    s3_source_bucket = 'maris-source-bucket'
    s3_target_bucket = 'maris-target-bucket'

    data = []

    s3 = boto3.resource('s3')
    src = s3.Bucket(s3_source_bucket)
    dest = s3.Bucket(s3_target_bucket)

    for obj in src.objects.all():
        # Skipping directories (S3 folders are just keys that end with '/')
        if obj.key.endswith('/'):
            continue

        copy_source = {
            'Bucket': s3_source_bucket,
            'Key': obj.key
        }

        print(f"Copying {obj.key}")
        try:
            # Perform the copy operation
            dest.copy(copy_source, obj.key)

            # Append a dictionary with relevan details to the data list
            data.append({'Bucket': obj.bucket_name, 'Key': obj.key})
        except Exception as e:
            print(f"Error: {e}")

    return data


def lambda_handler(event, context):
    # Call the "save_file_data" function and return appropriately formatted results
    return {
        'isBase64Encoded': False,
        'statusCode': 200,
        'body': json.dumps(save_file_data()),
        'headers': {"Access-Control-Allow-Origin": "*"}
    }
```
