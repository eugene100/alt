module "eks" {
  source = "terraform-aws-modules/eks/aws"

  cluster_name                   = local.eks_cluster_name
  cluster_version                = local.eks_cluster_version
  cluster_endpoint_public_access = true

  cluster_addons = {
    kube-proxy = {}
    vpc-cni    = {}
  }

  vpc_id                   = local.vpc_id
  subnet_ids               = flatten(local.priv_subnet_ids)
  control_plane_subnet_ids = local.pub_subnet_ids

  # Fargate profiles use the cluster primary security group so these are not utilized
  create_cluster_security_group = false
  create_node_security_group    = false

  fargate_profile_defaults = {
    # iam_role_additional_policies = {
    #   additional = aws_iam_policy.additional.arn
    # }
  }

  fargate_profiles = merge(
    {
      dev-apps = {
        name = "dev-apps"
        selectors = [
          {
            namespace = "backend"
            labels = {
              Application = "backend"
            }
          }
        ]

        # Using specific subnets instead of the subnets supplied for the cluster itself
        # subnet_ids = [module.vpc.private_subnets[1]]

        tags = local.tags

        timeouts = {
          create = "20m"
          delete = "20m"
        }
      }
    },
    # { for i in range(3) :
    #   "kube-system-${element(split("-", local.azs[i]), 2)}" => {
    #     selectors = [
    #       { namespace = "kube-system" }
    #     ]
    #     # We want to create a profile per AZ for high availability
    #     subnet_ids = [element(module.vpc.private_subnets, i)]
    #   }
    # }
  )

  tags = local.tags
}
