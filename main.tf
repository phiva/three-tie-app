# main.tf

provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source     = "./modules/vpc"
  cidr_block = var.vpc_cidr_block
}

module "subnet" {
  source = "./modules/subnet"
  vpc_id = module.vpc.vpc_id
}

module "security_group" {
  source = "./modules/security_group"
  vpc_id = module.vpc.vpc_id
}

module "autoscaling" {
  source             = "./modules/autoscaling"
  image_id           = module.image_id
  vpc_id             = module.vpc.vpc_id
  subnet_ids         = [module.subnet.web_a_id, module.subnet.web_b_id]
  security_group_ids = [module.security_group.web_sg_id]
}

module "load_balancer" {
  source             = "./modules/load_balancer"
  vpc_id             = module.vpc.vpc_id
  subnet_ids         = [module.subnet.web_a_id, module.subnet.web_b_id]
  security_group_ids = [module.security_group.web_sg_id]
}

module "rds" {
  source             = "./modules/rds"
  vpc_id             = module.vpc.vpc_id
  subnet_ids         = [module.subnet.db_a_id, module.subnet.db_b_id]
  security_group_ids = [module.security_group.app_sg_id]
}

module "route53" {
  source      = "./modules/route53"
  domain_name = "example.com" # Define your domain name here
  lb_dns_name = module.load_balancer.lb_dns_name
  lb_zone_id  = module.load_balancer.lb_zone_id
}
