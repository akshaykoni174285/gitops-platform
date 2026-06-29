
module "eks" {
    source = "terraform-aws-modules/eks/aws"
    version = "~>21.0"

    name = "gitops-eks"
    kubernetes_version = "1.33"
    endpoint_public_access = true 

    vpc_id = module.vpc.vpc_id
    subnet_ids = module.vpc.private_subnets

    eks_managed_node_groups = {
        default = {
            desired_capacity = 2
            max_capacity     = 4
            min_capacity     = 2

            instance_type = ["t3.medium"]
        }
    }
    tags = {
        Project   = "gitops-platform"
        ManagedBy = "terraform"
    }


}