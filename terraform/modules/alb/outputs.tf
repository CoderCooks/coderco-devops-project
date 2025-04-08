//Output values for the ALB module goes here --> Refer to the documentation for output values attributes

output "alb_arn" {
  description = "The ARN of the ALB"
  value       = aws_lb.alb.arn
}
output "alb_dns_name" {
  description = "The DNS name of the ALB"
  value       = aws_lb.alb.dns_name
}