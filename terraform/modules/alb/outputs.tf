
output "alb_dns_name" {
  value       = aws_lb.alb_main.dns_name
  description = "Public DNS name of the ALB"
}




