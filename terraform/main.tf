//Root Configuration Main File where modules are called

module "networking" {
  source = "./modules/networking"
  environment         = var.environment
  vpc_cidr            = var.vpc_cidr
  availability_zones  = var.availability_zones
  private_subnets     = var.private_subnets
  public_subnets      = var.public_subnets
  enable_nat_gateway  = var.enable_nat_gateway
  enable_vpn_gateway  = var.enable_vpn_gateway
  tags                = var.tags
}

module "ecs" {
    source = "../modules/ecs"
    
  
}

module "alb" {
    source = "../modules/alb"
  
}

module "route53" {
    source = "../modules/route53" 
}