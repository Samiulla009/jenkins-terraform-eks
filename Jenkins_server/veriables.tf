variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "subnet cidr"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "aws_key_pair_name" {
  type    = string
  default = "devops-testshell" # Replace with your existing key pair name
}

variable "ami_id" {
  type    = string
  default = "ami-0dee22c13ea7a9a67" # Amazon Linux AMI (Replace with a valid AMI for your region)
}

variable "aws_access_key" {
  type      = string
  default   = "AKIA6DXMK5XMIZRYJYGW"
  sensitive = true
}

variable "aws_secret_key" {
  type      = string
  default   = "J8n1IkgmYF0T3WLlWxGDaGVk7fhO/0LTpOyaXPoK"
  sensitive = true
}