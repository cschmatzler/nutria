resource "hcloud_server" "server" {
  name = local.name

  image              = var.image_id
  server_type        = var.server_type
  location           = var.location
  placement_group_id = var.placement_group_id

  ssh_keys = var.ssh_keys

  labels    = var.labels
  user_data = var.user_data

  lifecycle {
    ignore_changes = [
      image,
      ssh_keys,
      user_data
    ]
  }
}
