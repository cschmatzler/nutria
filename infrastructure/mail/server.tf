resource "hcloud_server" "mail" {
  name = "mail.nutria.cloud"

  image       = "debian-11"
  server_type = "cx21"
  location    = "fsn1"

  public_net {
    ipv4 = hcloud_primary_ip.mail.id
    ipv6 = hcloud_primary_ip.mailv6.id
  }

  ssh_keys = [var.ssh_key_id]

  labels = {
    "provisioner" = "terraform",
    "role"        = "mail"
  }

  user_data = templatefile("${path.module}/templates/user_data.yaml.tpl", {
    mailcow_conf = base64encode(templatefile("${path.module}/templates/mailcow.conf.tpl", {
      database_root_password = var.database_root_password
      database_password      = var.database_password
    }))
    redirect_conf = base64encode(file("${path.module}/templates/redirect.conf"))
  })
}
