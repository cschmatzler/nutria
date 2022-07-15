module "control_plane_nodes" {
  source = "./host"
  count  = local.control_plane_nodes.count

  role = "control-plane"

  server_type        = local.control_plane_nodes.server_type
  location           = local.control_plane_nodes.location
  placement_group_id = hcloud_placement_group.control_plane.id
  image_id           = var.image_id

  user_data = file("../talos/controlplane.yaml")

  ssh_keys    = [var.ssh_key_id]
  private_key = var.private_key
  public_key  = var.public_key

  network_id  = var.network_id
  subnet_id   = var.subnet_id
  rdns_domain = local.rdns_domain

  labels = {
    "provisioner" = "terraform",
    "role"        = "control-plane"
  }
}

resource "hcloud_load_balancer_target" "server" {
  count = local.control_plane_nodes.count

  type             = "server"
  load_balancer_id = hcloud_load_balancer.control_plane.id
  server_id        = module.control_plane_nodes[count.index].id
  use_private_ip   = true
}
