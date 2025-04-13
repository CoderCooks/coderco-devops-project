terraform {
  source = "../../../modules/networking"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  environment = "prod"
  cidr_block  = "10.30.0.0/16"
  tags = {
    Environment = "prod"
  }
}