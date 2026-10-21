provider "aws" {
  region = "eu-west-1"
}

module "network" {
  source = "./modules/network"
}

module "network_security" {
  source = "./modules/network_security"
  vpc_id = module.network.vpc_id
  allowed_ip_range = ["18.153.146.156/32", "203.0.113.25/32"]
}

module "application" {
  source             = "./modules/application"
  vpc_id             = module.network.vpc_id
  subnet1_id         = module.network.subnet1_id
  subnet2_id         = module.network.subnet2_id
  subnet3_id         = module.network.subnet3_id
  sg_ssh_id          = module.network_security.sg_ssh_id
  sg_public_http_id  = module.network_security.sg_public_http_id
  sg_private_http_id = module.network_security.sg_private_http_id

}