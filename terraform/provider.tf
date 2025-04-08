// This file defines the provider configuration for AWS
// and specifies the required provider version.

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.83.1"
    }
  }
}

provider "aws" {
  region = "eu-west-2"
  # Avoid hardcoding access keys in code!
  # Use environment variables or AWS credentials file
}
