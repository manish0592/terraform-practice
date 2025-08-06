variable "instance_type" {
  description = "Type of AWS instance to create"
  type        = string
  default     = ""
  
}

variable "ami_id" {
  description = "AMI ID to use for the AWS instance"
  type        = string
  default     = ""
  
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket to create"
  type        = string
  default     = ""
  
}

variable "role_name" {
  description = "Name of the IAM role to create"
  type        = string
  default     = ""
  
}

variable "policy_name" {
  description = "Name of the IAM policy to create"
  type        = string
  default     = ""
}