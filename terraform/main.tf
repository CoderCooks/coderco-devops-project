//Root Configuration Main File where modules are called

module "networking" {
    source = "../modules/networking"
  
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