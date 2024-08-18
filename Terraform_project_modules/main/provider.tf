terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.66"
    }
  }
}


provider "aws" {
  region     = var.aws_region
  access_key = "var.AWS_ACCESS_KEY"
  secret_key = "var.AWS_SECRET_KEY"
}
