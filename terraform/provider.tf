// This file defines the provider configuration for AWS
// and specifies the required provider version.
terraform {
  required_providers {

    required_version = ">= 1.3.0" # or match your actual version requirement

    aws = {
      source  = "hashicorp/aws"
      version = "5.83.1"
    }
  }
}

provider "aws" {
  region = "eu-west-2"
}
