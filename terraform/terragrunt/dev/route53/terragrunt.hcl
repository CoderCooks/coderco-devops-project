include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../modules/route53"
}

dependency "alb" {
  config_path = "../alb"
}

inputs = {
  domain_name   = "cokercooks.com"  
  record_name   = "app"            
  record_type   = "A"
  alb_dns_name  = dependency.alb.outputs.alb_dns_name
  alb_zone_id   = dependency.alb.outputs.alb_zone_id
}