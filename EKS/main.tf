#vpc

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "jenkins-vpc"
  cidr = var.vpc_cidr

  azs             = data.aws_availability_zones.azs.names
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_dns_hostnames = true
  enable_nat_gateway   = true
  single_nat_gateway   = true

  tags = {
    "kubernetes.io/cluster/my-eks-cluster" = "shared"
  }

  public_subnet_tags = {
    "kubernetes.io/cluster/my-eks-cluster" = "shared"
    "kubernetes.io/role/elb"               = 1
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/my-eks-cluster" = "shared"
    "kubernetes.io/role/internal-elb"      = 1
  }

}


#eks

module "eks" {
  source = "terraform-aws-modules/eks/aws"

  cluster_name    = "my-eks-cluster"
  cluster_version = "1.24"

  cluster_endpoint_public_access = true

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  eks_managed_node_groups = {
    nodes = {
      min_size     = 1
      max_size     = 3
      desired_size = 2

      instance_type = ["t2.small"]
    }
  }

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}

# module "ec2_instance" {
#   source = "terraform-aws-modules/ec2-instance/aws"

#   name = "jenkins-server-EC2"

#   instance_type               = var.instance_type
#   key_name                    = var.aws_key_pair_name
#   monitoring                  = true
#   vpc_security_group_ids      = [module.sg.security_group_id]
#   subnet_id                   = module.vpc.public_subnets[0]
#   associate_public_ip_address = true
#   user_data                   = file("jenkins-install.sh")
#   availability_zone           = data.aws_availability_zones.azs.names[0]
#   tags = {
#     Name        = "jenkins-server-EC2"
#     Terraform   = "true"
#     Environment = "dev"
#   }
# }

# resource "aws_instance" "ec2_instance" {
#   ami                    = var.ami_id
#   instance_type          = var.instance_type
#   key_name               = var.aws_key_pair_name
#   #vpc_security_group_ids = [aws_security_group.ec2_security_group.id]

#   # User data script to configure the instance
#   tags = {
#     Name = "jenkins-EC2"
#   }

# }
