output "ec2_id" {
  description = "The EC2 instance ID"
  value       = aws_instance.ec2.id
}

output "ec2_public_ip" {
  description = "The EC2 instance public IP"
  value       = aws_instance.ec2.public_ip
}