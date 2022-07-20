resource "hcloud_server" "server" {
  name = "turn.medium.place"

  image       = "debian-11"
  server_type = "cpx11"
  location    = "fsn1"

  ssh_keys = [var.ssh_key_id]

  labels = {
    "provisioner" = "terraform",
    "role"        = "turn"
  }

  user_data = templatefile("${path.module}/templates/user_data.yaml.tpl", {
    turn_secret = var.turn_secret
  })
}
