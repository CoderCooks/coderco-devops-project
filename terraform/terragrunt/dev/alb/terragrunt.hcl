include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../modules/alb"
}

dependency "networking" {
  config_path = "../networking"
}

inputs = {
  alb_name          = "${local.project}-${local.environment}-alb"
  vpc_id            = dependency.networking.outputs.vpc_id
  subnet_ids        = dependency.networking.outputs.public_subnets
  health_check_path = "/"
  tags              = local.tags
}