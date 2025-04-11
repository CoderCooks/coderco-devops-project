//Resource blocks for the Route53 components goes here


data "aws_route53_zone" "existing" {
  name = var.domain_name
}

# resource "aws_route53_record" "app_alias_record" {
#   count   = var.record_type == "A" ? 1 : 0
#   zone_id = data.aws_route53_zone.existing.zone_id
#   name    = var.record_name
#   type    = var.record_type

#   alias {
#     name                   = var.alb_dns_name
#     zone_id                = data.aws_route53_zone.existing.zone_id
#     evaluate_target_health = true
#   }

# }





resource "aws_route53_record" "app_cname_record" {
  count   = var.record_type == "CNAME" ? 1 : 0
  zone_id = data.aws_route53_zone.existing.zone_id
  name    = var.record_name
  type    = "CNAME"
  ttl     = 300
  records = [var.alb_dns_name]

}
