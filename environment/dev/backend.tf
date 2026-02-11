terraform {
  backend "s3" {
    bucket         = "vinod-terraform-state-bucket-0897"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "vinodk-terraform-lock-table"
    encrypt        = true
  }
}
