# S3 Bucket Name
output "s3_bucket_name" {
  description = "Name of the S3 bucket used for storing the Terraform state file"
  value       = aws_s3_bucket.tf_bucket.id
}

# IAM Role Name
output "iam_role_name" {
  description = "Name of the IAM role created for EC2"
  value       = aws_iam_role.ec2_role.name
}

# IAM Instance Profile Name
output "iam_instance_profile" {
  description = "Name of the IAM instance profile"
  value       = aws_iam_instance_profile.ec2_profile.name
}

# EC2 Instance ID
output "ec2_instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.ec2.id
}

# EC2 Public IP
output "ec2_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.ec2.public_ip
}

# EC2 Private IP
output "ec2_private_ip" {
  description = "Private IP of the EC2 instance"
  value       = aws_instance.ec2.private_ip
}

