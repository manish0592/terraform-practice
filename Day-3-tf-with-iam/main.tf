# 1. Create an S3 Bucket (for storing Terraform state file)
resource "aws_s3_bucket" "tf_bucket" {
  bucket = var.s3_bucket_name
}

# 2. Enable Versioning on the S3 Bucket
resource "aws_s3_bucket_versioning" "tf_bucket" {
  bucket = aws_s3_bucket.tf_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

# 3. Create an IAM role for EC2 instances
resource "aws_iam_role" "ec2_role" {
  name = var.role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Effect = "Allow"
        Sid    = ""
      }
    ]
  })
}

# 4. IAM Policy Attachment (Allow EC2 to access S3)
resource "aws_iam_role_policy" "ec2_s3_access" {
  name   = var.policy_name
  role   = aws_iam_role.ec2_role.id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Action = [
        "s3:*"
      ],
      Resource = "*"
    }]
  })
}

# 5. IAM Instance Profile (needed to attach IAM role to EC2)
resource "aws_iam_instance_profile" "ec2_profile" {
  name = "EC2InstanceProfile"
  role = aws_iam_role.ec2_role.name
}

# 6. EC2 Instance
resource "aws_instance" "ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name
  tags = {
    Name = "TerraformEC2"
  }
}