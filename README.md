# terraform/providers.tf
If you want to recreate this project add new "provider.tf" file in Terraform folder and 
fill the extra details yourself

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.45"
    }
  }
}

provider "aws" {
  region = "us-east-1" # Or your preferred AWS region
}