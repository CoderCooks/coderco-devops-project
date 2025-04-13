include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../modules/ecs"
}

dependency "networking" {
  config_path = "../networking"
}

dependency "alb" {
  config_path = "../alb"
}

inputs = {
  vpc_id              = dependency.networking.outputs.vpc_id
  subnets             = dependency.networking.outputs.private_subnets
  alb_security_group  = dependency.alb.outputs.alb_security_group
  target_group_arn    = dependency.alb.outputs.target_group_arn

  project_name        = local.project
  ecr_repo_name       = "coderco-app"
  allowed_cidr_blocks = ["0.0.0.0/0"]

  ecs_task_cpu        = 1024
  ecs_task_memory     = 3072
  operating_system_family = "LINUX"
  cpu_architecture        = "ARM64"
}