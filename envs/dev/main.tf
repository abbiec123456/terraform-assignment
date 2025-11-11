module "network" {
  source          = "../../modules/network"
  vpc_cidr        = var.vpc_cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
}

module "compute" {
  source          = "../../modules/compute"
  vpc_id          = module.network.vpc_id
  public_subnets  = module.network.public_subnets
  image_id        = var.image_id
  key_name        = var.key_name
  user_data_file  = var.user_data_file
}

module "alb" {
  source           = "../../modules/alb"
  vpc_id           = module.network.vpc_id
  public_subnets   = [for s in module.network.public_subnets : s.id]
  web_instance_ids = module.compute.web_instance_ids
}
