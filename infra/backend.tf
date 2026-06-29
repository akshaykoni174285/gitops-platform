
terraform {
  backend "s3" {
    bucket = "akshay-gitops-tfstate-2026"
    key = "infra/terraform.tfstate"
    region = "ap-south-1"
    # dynamodb_table = "gitops-tflock"
    use_lockfile = true
    encrypt = true
  }
}