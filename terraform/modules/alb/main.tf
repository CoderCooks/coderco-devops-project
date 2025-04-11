# Application Load Balancer 
# resource "aws_acm_certificate" "cert" {
#   domain_name       = var.domain_name
#   validation_method = "DNS"


# }

# resource "aws_route53_record" "cert_validation" {
#   name    = tolist(aws_acm_certificate.cert.domain_validation_options)[0].resource_record_name
#   type    = tolist(aws_acm_certificate.cert.domain_validation_options)[0].resource_record_type
#   zone_id = var.route53_zone_id
#   records = [tolist(aws_acm_certificate.cert.domain_validation_options)[0].resource_record_value]
#   ttl     = 60
# }

# resource "aws_acm_certificate_validation" "cert_validation" {
#   certificate_arn         = aws_acm_certificate.cert.arn
#   validation_record_fqdns = [aws_route53_record.cert_validation.fqdn]
# }

# data "aws_acm_certificate" "issued" {
#   domain   = var.domain_name
#   statuses = ["ISSUED"]
# }
resource "aws_alb" "alb_main" {
  name               =  var.alb_name 
  load_balancer_type = "application"
  internal           = false
  subnets            = var.subnet_ids
  security_groups    = [aws_security_group.alb_sg.id]
 
}

# Target Group for the application 

resource "aws_alb_target_group" "tg_app" {
  name        = "mvp-app-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"

  health_check {
    healthy_threshold   = 3
    unhealthy_threshold = 2
    interval            = 20
    timeout             = 3
    protocol            = "HTTP"
    path                = var.health_check_path
    matcher             = "200"
  }

  tags = var.tags
}

# HTTP Listener: Redirects to HTTPS #
# resource "aws_lb_listener" "listener_http" {
#   load_balancer_arn = aws_alb.alb_main.arn
#   port              = 80
#   protocol          = "HTTP"

#   default_action {
#     type = "redirect"
#     redirect {
#       port        = "443"
#       protocol    = "HTTPS"
#       status_code = "HTTP_301"
#     }
#   }
# }


resource "aws_lb_listener" "listener_http2" {
  load_balancer_arn = aws_alb.alb_main.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.tg_app.arn
  }
}

# HTTPS Listener: Forwards traffic to Target Group #
# resource "aws_alb_listener" "listener_https" {
#   load_balancer_arn = aws_alb.alb_main.arn
#   port              = 443
#   protocol          = "HTTPS"
#   ssl_policy        = "ELBSecurityPolicy-2016-08"
#   certificate_arn = data.aws_acm_certificate.issued.arn

  

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_alb_target_group.tg_app.arn
#   }
# }

resource "aws_security_group" "alb_sg" {
  name        = var.alb_name
  description = "Security group for ALB"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

# resource "aws_lb_target_group_attachment" "ecs-tg-group-attachment-aza" {
#   target_group_arn = aws_alb_target_group.tg_app.arn
#   target_id        = "10.0.104.4"
#   port             = 3000
# }
