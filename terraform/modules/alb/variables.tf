variable "alb_name" {
  description = "The alb name"
  type        = string
  
}

# VPC ID where the ALB and target group will be created

variable "vpc_id" {
  type        = string
  description = "ID of the VPC"
}

# Subnet IDs to deploy the ALB into (usually public subnets)

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs for the ALB"
}

# Security group IDs for the ALB

variable "security_groups" {
  type        = list(string)
  description = "List of security group IDs for the ALB"
}

# ACM Certificate ARN for HTTPS listener

variable "certificate_arn" {
  type        = string
  description = "ARN of the ACM certificate to use for HTTPS"
}

# Health check path for the target group

variable "health_check_path" {
  type        = string
  default     = "/"
  description = "Path used for health checks in the target group"
}
