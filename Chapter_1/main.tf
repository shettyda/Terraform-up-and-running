# main.tf (root)

module "network" {
  source   = "./Modules/network"
  igw_name = "Terra_Created_IGW" # optional, has a default
  # No vpc_id here: the VPC is created inside this module
}

module "security" {
  source = "./Modules/security"
  vpc_id = module.network.vpc_id
}

module "alb" {
  source            = "./Modules/alb"
  vpc_id            = module.network.vpc_id
  lb_subnet_ids     = module.network.subnet_ids
  lb_security_group = [module.security.lb_sg_id]
}

module "compute" {
  source             = "./Modules/compute"
  min_instance       = 1
  max_instance       = 3
  desired_instance   = 1
  subnet_id          = module.network.subnet_ids
  target_group_arn   = [module.alb.target_group_arn]
  security_group_ids = [module.security.instance_sg_id]
  ami_id             = "ami-09d88f7c4c272b0c5" # from your launch template; confirm it exists in your region
  instance_type      = "t2.micro"
}