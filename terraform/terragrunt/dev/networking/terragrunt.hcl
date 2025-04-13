terraform {
  source = "../../../modules/networking"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  project = local.project
  tags    = local.tags
}

dependencies {
  paths = ["../networking"]
}