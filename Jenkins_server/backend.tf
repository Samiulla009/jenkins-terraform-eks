terraform {
  backend "s3" {
    bucket = "shaik.test.s3"
    key    = "jenkins/terraform.tfstate"
    region = "ap-south-1"
  }
}