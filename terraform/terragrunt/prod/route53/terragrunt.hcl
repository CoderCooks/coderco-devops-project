terraform {
  source = "../../../modules/route53"
}

include {
  path = find_in_parent_folders()
}

dependency "alb" {
  config_path = "../alb"
}

inputs = {
  domain_name   = "cokercooks.com"
  record_name   = "app.prod.cokercooks.com"
  record_type   = "A"
  alb_dns_name  = dependency.alb.outputs.alb_dns_name
  alb_zone_id   = dependency.alb.outputs.alb_zone_id
}