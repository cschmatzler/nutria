resource "random_string" "server" {
  length  = 5
  lower   = true
  upper   = false
  numeric = true
  special = false
}

locals {
  # General
  # -------
  name = "${var.role}-${random_string.server.id}"

  # SSH
  # ---
  ssh_private_key   = trimspace(file(var.private_key))
  ssh_public_key    = trimspace(file(var.public_key))
  ssh_identity_file = var.private_key
  ssh_args          = "-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -i ${local.ssh_identity_file}"
}
