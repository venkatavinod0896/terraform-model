terraform {
  backend "s3" {
    bucket         = "vinod-terraform-state-bucket-0896"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "use_lockfile"
    encrypt        = true
  }
}
