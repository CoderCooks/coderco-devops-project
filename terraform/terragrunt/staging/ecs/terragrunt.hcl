terraform {
  source = "../../../modules/ecs"
}

include {
  path = find_in_parent_folders()
}

dependency "networking" {
  config_path = "../networking"
}

dependency "alb" {
  config_path = "../alb"
}

inputs = {
  vpc_id             = dependency.networking.outputs.vpc_id
  subnets            = dependency.networking.outputs.private_subnets
  alb_security_group = dependency.alb.outputs.alb_security_group
  target_group_arn   = dependency.alb.outputs.target_group_arn
  ecr_repo_name      = "coderco-app"
  project_name       = "codercooks"
  tags = {
    Environment = "staging"
  }
}