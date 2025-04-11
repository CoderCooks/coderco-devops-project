
output "alb_dns_name" {
  value       = aws_alb.alb_main.dns_name
  description = "Public DNS name of the ALB"
}

output "alb_security_group" {
  value       = aws_security_group.alb_sg.id
  description = "Security group ID for the ALB"
  
}

output "target_group_arn" {
  value       = aws_alb_target_group.tg_app.arn
  description = "ARN of the target group for the ALB"
  
}
