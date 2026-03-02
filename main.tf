module "network" {
  source = "./modules/network"
  region = var.region
}

module "nat" {
  source  = "./modules/nat"
  region  = var.region
  network = module.network.network_name
}

module "vm" {
  source  = "./modules/vm"
  zone    = var.zone
  subnet  = module.network.subnet_name
}