output "public_ec2_instance_public_ip" {
  description = "The public IP address of the public instance"
  value       = aws_instance.public_instance.public_ip
}

output "private_ec2_instance_private_ip" {
  description = "The private IP address of the private instance"
  value       = aws_instance.private_instance.private_ip
}

output "peering_connection" {
  description = "Account ID for the VPC Peering"
  value = aws_vpc_peering_connection.foo.peer_owner_id
}