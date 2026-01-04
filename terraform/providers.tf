terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  cloud {
    organization = "cloudwithben-org"

    workspaces {
      name = "network-vpc-prod"
    }
  }
}

provider "aws" {
  region = var.aws_region
  
  # Terraform Cloud will provide credentials via OIDC
  # No assume_role needed - handled by environment variables
}