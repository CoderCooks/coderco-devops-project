// This file is used to configure the backend for Terraform.
# It specifies the S3 bucket and region for storing the Terraform state file.
# The backend configuration is essential for remote state management.

terraform {

  backend "s3" {
    bucket         = "codercooks-project-bucket"
    key            = "codercooks/terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
  }

}
