resource "hcloud_server_network" "server" {
  subnet_id = var.subnet_id
  server_id = hcloud_server.server.id
}

data "hetznerdns_zone" "nutria" {
  name = "nutria.cloud"
}

resource "hetznerdns_record" "server" {
  zone_id = data.hetznerdns_zone.nutria.id
  type    = "A"
  ttl     = 60
  name    = format("%s.cluster", local.name)
  value   = hcloud_server.server.ipv4_address
}

resource "hetznerdns_record" "serverv6" {
  zone_id = data.hetznerdns_zone.nutria.id
  type    = "AAAA"
  ttl     = 60
  name    = format("%s.cluster", local.name)
  value   = hcloud_server.server.ipv6_address
}

resource "hcloud_rdns" "server" {
  server_id  = hcloud_server.server.id
  ip_address = hcloud_server.server.ipv4_address
  dns_ptr    = format("%s.%s", local.name, var.rdns_domain)
}

resource "hcloud_rdns" "serverv6" {
  server_id  = hcloud_server.server.id
  ip_address = hcloud_server.server.ipv6_address
  dns_ptr    = format("%s.%s", local.name, var.rdns_domain)
}
