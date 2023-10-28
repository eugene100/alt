#tfsec:ignore:aws-vpc-no-excessive-port-access tfsec:ignore:aws-vpc-no-public-ingress-acl
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.2"

  name                         = var.name
  cidr                         = var.vpc_cidr
  azs                          = split(",", var.legacy_azs)
  public_subnets               = split(",", var.public_subnets)
  private_subnets              = split(",", var.private_subnets)

  enable_dns_hostnames   = true
  enable_dns_support     = true
  enable_nat_gateway     = true
  single_nat_gateway     = false
  one_nat_gateway_per_az = true

  tags = {
    "wl:environment" = var.name
    "wl:service"     = "vpc"
  }

  vpc_tags = {
    Name                                              = var.name
    "kubernetes.io/cluster/wl-01" = "shared"
  }
}
