module "network" {
  source = "./network"

  hcloud_token = var.hcloud_token

  public_key = var.public_key
}

module "cluster" {
  source = "./cluster"

  hcloud_token         = var.hcloud_token
  cloudflare_api_token = var.cloudflare_api_token

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

module "mail" {
  source = "./mail"

  ssh_key_id = module.network.ssh_key_id

  database_root_password = var.mail_database_root_password
  database_password      = var.mail_database_password
}

# module "turn" {
#   source = "./turn"
#
#   hcloud_token = var.hcloud_token
#
#   ssh_key_id = module.network.ssh_key_id
#
#   turn_secret = var.turn_secret
# }
