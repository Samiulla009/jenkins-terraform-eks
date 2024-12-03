output "vpc_id" {
  value = module.vpc.vpc_id
}

output "security_group_id" {
  value = module.sg.security_group_id
}

output "ec2_instance_public_ip" {
  value = module.ec2_instance.public_ip
}