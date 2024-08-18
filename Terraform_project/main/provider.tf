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
  access_key = "AKIAXJ7AHCJQZX4XN74A"
  secret_key = "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"
}
