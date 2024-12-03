variable "vpc_cidr" {
  type    = string
  default = "192.168.0.0/16"
}

variable "public_subnets" {
  description = "subnet cidr"
  type        = list(string)
  default     = ["192.168.4.0/24", "192.168.5.0/24", "192.168.6.0/24"]
}

variable "private_subnets" {
  description = "Subnets CIDR"
  type        = list(string)
  default     = ["192.168.1.0/24", "192.168.2.0/24", "192.168.3.0/24"]
}
