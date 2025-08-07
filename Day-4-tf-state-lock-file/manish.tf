provider "aws" {
  region = "us-east-1"
}

# Create S3 Bucket for Terraform state
resource "aws_s3_bucket" "tf_state" {
  bucket = "tf-state-bucket-07082025" 
  force_destroy = true
  tags = {
    Name = "TerraformStateBucket"
  }
}

# EC2 Instance
resource "aws_instance" "dev-ec2" {
  ami           = "ami-08a6efd148b1f7504"
  instance_type = "t2.micro"
  tags = {
    Name = "Dev environment EC2 Instance"
  }
}

# Terraform Backend Configuration
# This configuration is essential for managing Terraform state in a collaborative environment.
# This configuration is used to store the Terraform state file in S3 with locking enabled
# to prevent concurrent modifications.
# Ensure the bucket exists before running this configuration.
# The bucket name should be unique across all AWS accounts in the region.
# The region should match the region where the S3 bucket is created.
# The key is the path within the bucket where the state file will be stored.
# The use_lockfile option is set to true to enable state locking. work only with S3 bucket
# The dynamodb_table is used for state locking to prevent concurrent operations.

terraform {
  backend "s3" {
    bucket  = "tf-state-bucket-07082025"
    region  = "us-east-1"
    key     = "ec2-local/terraform.tfstate"
    #use_lockfile = true
    dynamodb_table = "tfstatelock-dev"
    encrypt = true

  }
}
