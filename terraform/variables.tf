variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
}

variable "public_subnets" {
  description = "List of public subnet CIDRs"
  type        = list(string)
}

variable "private_subnets" {
  description = "List of private subnet CIDRs"
  type        = list(string)
}

variable "enable_nat_gateway" {
  description = "Enable NAT Gateway(s) for private subnet internet access"
  type        = bool
}

variable "enable_vpn_gateway" {
  description = "Enable a VPN Gateway"
  type        = bool
}

variable "tags" {
  description = "Map of tags to apply to resources"
  type        = map(string)
}


//ALB

variable "vpc_id" {
  type        = string
  description = "ID of the VPC"
}


variable "alb_name" {
  description = "The alb name"
  type        = string

}


variable "certificate_arn" {
  type        = string
  description = "ARN of the ACM certificate to use for HTTPS"
}
