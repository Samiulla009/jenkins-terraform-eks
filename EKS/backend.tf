terraform {
  backend "s3" {
    bucket = "shaik.test.s3"
    key    = "eks/terraform.tfstate"
    region = "ap-south-1"
  }
}