resource "hcloud_primary_ip" "mail" {
  name          = "mail"
  type          = "ipv4"
  datacenter    = "fsn1-dc14"
  assignee_type = "server"
  auto_delete   = false

  labels = {
    "provisioner" = "terraform",
  }
}

resource "hcloud_primary_ip" "mailv6" {
  name          = "mailv6"
  type          = "ipv6"
  datacenter    = "fsn1-dc14"
  assignee_type = "server"
  auto_delete   = false

  labels = {
    "provisioner" = "terraform",
  }
}

data "hetznerdns_zone" "nutria" {
  name = "nutria.cloud"
}

resource "hetznerdns_record" "mail" {
  zone_id = data.hetznerdns_zone.nutria.id
  type    = "A"
  ttl     = 60
  name    = "mail"
  value   = hcloud_primary_ip.mail.ip_address
}

resource "hetznerdns_record" "mailv6" {
  zone_id = data.hetznerdns_zone.nutria.id
  type    = "AAAA"
  ttl     = 60
  name    = "mail"
  # `ip_address` here returns an entire subnet - we just want the first address
  value   = cidrhost(format("%s/64", hcloud_primary_ip.mailv6.ip_address), 1)
}

resource "hcloud_rdns" "mail" {
  server_id  = hcloud_server.mail.id
  ip_address = hcloud_primary_ip.mail.ip_address
  dns_ptr    = "mail.nutria.cloud"
}

resource "hcloud_rdns" "mailv6" {
  server_id  = hcloud_server.mail.id
  ip_address = cidrhost(format("%s/64", hcloud_primary_ip.mailv6.ip_address), 1)
  dns_ptr    = "mail.nutria.cloud"
}
