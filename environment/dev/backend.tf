terraform {
  backend "s3" {
    bucket         = "vinod-terraform-state-bucket-0896"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "vinod-terraform-lock-table"
    encrypt        = true
  }
}
