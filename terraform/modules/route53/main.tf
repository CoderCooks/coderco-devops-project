//Resource blocks for the Route53 components goes here


data "aws_route53_zone" "existing" {
  name = "cokercooks.com"
}

resource "aws_route53_record" "app_alias_record" {
  count   = var.record_type == "A" ? 1 : 0
  zone_id = data.aws_route53_zone.existing.zone_id
  name    = var.domain_name
  type    = var.record_type

  alias {
    name                   = var.alb_dns_name
    zone_id                = var.alb_zone_id
    evaluate_target_health = true
  }

  depends_on = [aws_route53_zone.this]
}

resource "aws_route53_record" "app_cname_record" {
  count   = var.record_type == "CNAME" ? 1 : 0
  zone_id = aws_route53_zone.this.zone_id
  name    = var.domain_name
  type    = "CNAME"
  ttl     = 300
  records = [var.alb_dns_name]

  depends_on = [aws_route53_zone.this]
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.94.1"
    }
  }
}

provider "aws" {
  region  = "eu-west-2"
  profile = "default"
}
