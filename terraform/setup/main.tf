terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.23.0"
    }
  }
  backend "s3" {
    bucket         = "devopsrepo-tf-state"
    key            = "tf-state-setup"
    region         = "eu-west-3"
    encrypt        = true
    dynamodb_table = "devopsrepo-tf-lock"

  }



}

provider "aws" {
  region = "eu-west-3"
  default_tags {
    tags = {
      Environment = terraform.workspace
      Project     = var.project
      Contact     = var.contact
      ManageBy    = "Terraform/setup"
    }
  }
}