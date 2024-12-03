provider "aws" {
  region     = "ap-south-1" # Change to your preferred region
  secret_key = var.aws_secret_key
  access_key = var.aws_access_key
}

