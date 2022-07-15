module "worker_nodes" {
  source   = "./host"
  for_each = local.worker_nodes

  role = "worker"

  server_type        = each.value.server_type
  location           = each.value.location
  placement_group_id = element(hcloud_placement_group.workers.*.id, ceil(each.value.index / 10))
  image_id           = var.image_id

  user_data = file("../talos/worker.yaml")

  ssh_keys    = [var.ssh_key_id]
  private_key = var.private_key
  public_key  = var.public_key

  network_id  = var.network_id
  subnet_id   = var.subnet_id
  rdns_domain = local.rdns_domain

  labels = {
    "provisioner" = "terraform",
    "role"        = "worker"
  }
}
