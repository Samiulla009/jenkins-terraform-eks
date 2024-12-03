output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnets" {
  description = "The list of public subnets in the VPC"
  value       = module.vpc.public_subnets
}

output "private_subnets" {
  description = "The list of private subnets in the VPC"
  value       = module.vpc.private_subnets
}

output "eks_cluster_id" {
  description = "The ID of the EKS cluster"
  value       = module.eks.cluster_id
}

output "eks_cluster_endpoint" {
  description = "The endpoint of the EKS cluster"
  value       = module.eks.cluster_endpoint
}

# output "eks_cluster_kubeconfig" {
#   description = "The kubeconfig for accessing the EKS cluster"
#   value       = module.eks.cluster_kubeconfig
# }
