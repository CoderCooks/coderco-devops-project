terraform {
  source = "../../../modules/alb"
}

include {
  path = find_in_parent_folders()
}

dependency "networking" {
  config_path = "../networking"
}

inputs = {
  alb_name           = "app-alb-prod"
  vpc_id             = dependency.networking.outputs.vpc_id
  subnet_ids         = dependency.networking.outputs.public_subnets
  health_check_path  = "/"
  certificate_arn   = "arn:aws:acm:region:account:certificate/staging-cert-id"
  tags = {
    Environment = "prod"
  }
}