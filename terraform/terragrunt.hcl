locals {
  region = "eu-west-2"
}

remote_state {
  backend = "s3"
  config = {
    bucket         = "my-terraform-state-bucket"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = local.region
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

terraform {
  source = "./modules"
}

dependency "networking" {
  config_path = "../networking" 
}

dependency "route53" {
  config_path = "../route53"
}

dependency "ecs" {
  config_path = "../ecs"
}

dependency "alb" {
  config_path = "../alb"
}
