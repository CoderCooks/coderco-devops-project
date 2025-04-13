locals {
  environment = "dev"
  project     = "codercooks"
  tags = {
    Environment = local.environment
    Project     = local.project
  }
}