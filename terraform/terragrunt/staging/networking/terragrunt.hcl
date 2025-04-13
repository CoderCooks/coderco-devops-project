terraform {
  source = "../../../modules/networking"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  environment = "staging"
  cidr_block  = "10.20.0.0/16"
  tags = {
    Environment = "staging"
  }
}