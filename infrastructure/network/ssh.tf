locals {
  ssh_public_key = trimspace(file(var.public_key))
}

resource "hcloud_ssh_key" "workstation" {
  name       = "workstation"
  public_key = local.ssh_public_key
}
