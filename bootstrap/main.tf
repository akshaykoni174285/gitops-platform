provider "aws" {
  region = "ap-south-1"
}

# pick a GLOBALLY-unique bucket name — change the suffix
resource "aws_s3_bucket" "tfstate" {
  bucket = "akshay-gitops-tfstate-2026"
}

resource "aws_s3_bucket_versioning" "tfstate" {
  bucket = aws_s3_bucket.tfstate.id
  versioning_configuration {
    status = "Enabled"   # lets us recover a deleted/corrupted state — war-room TF-1
  }
}
