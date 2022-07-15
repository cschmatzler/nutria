resource "hcloud_server_network" "server" {
  subnet_id = var.subnet_id
  server_id = hcloud_server.server.id
}

resource "hcloud_rdns" "server" {
  server_id  = hcloud_server.server.id
  ip_address = hcloud_server.server.ipv4_address
  dns_ptr    = format("%s.%s", local.name, var.rdns_domain)
}
