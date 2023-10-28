# varables to use throughout the cluster terraform
locals {
  vpc_id                = data.terraform_remote_state.vpc.outputs.vpc_id
  vpc_cidr              = data.terraform_remote_state.vpc.outputs.vpc_cidr_block
  pub_subnet_ids        = data.terraform_remote_state.vpc.outputs.public_subnets
  priv_subnet_ids       = data.terraform_remote_state.vpc.outputs.private_subnets
  eks_cluster_name      = "dev-01"
  eks_cluster_version   = "1.28"
  # eks_private_subnet_id = ["subnet-0fca607316f594fec", "subnet-0f8a2cbeb7835e251", "subnet-00f56702b56d75eec"]
  eks_log_group         = "/aws/eks/${local.eks_cluster_name}/cluster"
  ec2_key_name          = data.terraform_remote_state.vpc.outputs.key_pair_name
  azs                   = ["us-east-1a", "us-east-1b", "us-east-1c"]

  public_access_cidrs = [
    "176.122.90.90/32",   # Eugene's home
  ]
  tags = {
    "environment" = "dev"
  }
}
