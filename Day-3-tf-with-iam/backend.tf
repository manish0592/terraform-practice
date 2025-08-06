terraform {
  backend "s3" {
    bucket  = "manage-tf-state-bucket-06082025"
    region  = "us-east-1"
    key     = "terraform.tfstate"

  }
}