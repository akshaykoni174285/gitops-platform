
data "aws_availability_zones" "available" {
  state = "available"
}


output "az" {
  value = data.aws_availability_zones.available.names
}


module "vpc" {
    source = "terraform-aws-modules/vpc/aws"
    name = "gitops-vpc"

    cidr = "10.0.0.0/16"
    azs = slice(data.aws_availability_zones.available.names, 0, 2)
    private_subnets = ["10.0.0.0/24", "10.0.1.0/24"]
    public_subnets  = ["10.0.10.0/24", "10.0.11.0/24"]

    enable_nat_gateway = true
    single_nat_gateway = true

    public_subnet_tags  = { "kubernetes.io/role/elb"          = "1" }
    private_subnet_tags = { "kubernetes.io/role/internal-elb" = "1" }

    tags = {
        Project   = "gitops-platform"
        ManagedBy = "terraform"
    } 
}