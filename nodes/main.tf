module "network" {
  source = "./network"

  hcloud_token = var.hcloud_token

  public_key = var.public_key
}

module "cluster" {
  source = "./cluster"

  hcloud_token = var.hcloud_token
  hdns_token   = var.hdns_token

  private_key = var.private_key
  public_key  = var.public_key
  ssh_key_id  = module.network.ssh_key_id

  network_id = module.network.network_id
  subnet_id  = module.network.cluster_subnet_id

  image_id = var.image_id
}

output "cluster_nodes" {
  value = module.cluster
}
