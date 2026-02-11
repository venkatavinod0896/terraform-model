provider "aws" {
  region = "us-east-1"
}

locals {
  common_tags = {
    Environment = "dev"
    Project     = "terraform-model"
    ManagedBy   = "Terraform"
  }
}

module "vpc" {
  source = "../../modules/vpc"

  env            = "dev"
  vpc_cidr       = "10.10.0.0/16"
  public_subnets = {
    "us-east-1a" = "10.10.1.0/24"
    "us-east-1b" = "10.10.2.0/24"
  }
  common_tags = local.common_tags
}

module "sg" {
  source = "../../modules/security-group"

  env    = "dev"
  vpc_id = module.vpc.vpc_id

  ingress_rules = [
    {
      port = 22
      cidr = ["0.0.0.0/0"]
    },
    {
      port = 80
      cidr = ["0.0.0.0/0"]
    }
  ]
}

module "ec2" {
  source = "../../modules/ec2"

  env        = "dev"
  ami        = "ami-0c02fb55956c7d316"
  instances  = {
    web = "t2.micro"
    api = "t2.micro"
  }

  subnet_ids  = module.vpc.public_subnet_ids
  sg_ids      = [module.sg.sg_id]
  common_tags = local.common_tags
}
