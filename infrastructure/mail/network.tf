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
  value = cidrhost(format("%s/64", hcloud_primary_ip.mailv6.ip_address), 1)
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

resource "hcloud_firewall" "mail" {
  name = "mail"

  rule {
    direction       = "out"
    protocol        = "tcp"
    port            = "53"
    destination_ips = ["0.0.0.0/0"]
  }

  rule {
    direction       = "out"
    protocol        = "udp"
    port            = "53"
    destination_ips = ["0.0.0.0/0"]
  }

  rule {
    direction       = "out"
    protocol        = "tcp"
    port            = "1024-65535"
    destination_ips = ["0.0.0.0/0"]
  }

  rule {
    direction       = "out"
    protocol        = "udp"
    port            = "1024-65535"
    destination_ips = ["0.0.0.0/0"]
  }

  rule {
    direction       = "out"
    protocol        = "tcp"
    port            = "25"
    destination_ips = ["0.0.0.0/0"]
  }

  rule {
    direction       = "out"
    protocol        = "tcp"
    port            = "465"
    destination_ips = ["0.0.0.0/0"]
  }

  rule {
    direction       = "out"
    protocol        = "tcp"
    port            = "587"
    destination_ips = ["0.0.0.0/0"]
  }

  rule {
    direction       = "out"
    protocol        = "tcp"
    port            = "80"
    destination_ips = ["0.0.0.0/0"]
  }

  rule {
    direction       = "out"
    protocol        = "tcp"
    port            = "443"
    destination_ips = ["0.0.0.0/0"]
  }

  rule {
    direction       = "out"
    protocol        = "icmp"
    destination_ips = ["0.0.0.0/0"]
  }

  rule {
    direction  = "in"
    protocol   = "tcp"
    port       = "22"
    source_ips = ["0.0.0.0/0"]
  }

  rule {
    direction  = "in"
    protocol   = "tcp"
    port       = "25"
    source_ips = ["0.0.0.0/0"]
  }

  rule {
    direction  = "in"
    protocol   = "tcp"
    port       = "465"
    source_ips = ["0.0.0.0/0"]
  }

  rule {
    direction  = "in"
    protocol   = "tcp"
    port       = "587"
    source_ips = ["0.0.0.0/0"]
  }

  rule {
    direction  = "in"
    protocol   = "tcp"
    port       = "143"
    source_ips = ["0.0.0.0/0"]
  }

  rule {
    direction  = "in"
    protocol   = "tcp"
    port       = "993"
    source_ips = ["0.0.0.0/0"]
  }

  rule {
    direction  = "in"
    protocol   = "tcp"
    port       = "4190"
    source_ips = ["0.0.0.0/0"]
  }

  rule {
    direction  = "in"
    protocol   = "tcp"
    port       = "80"
    source_ips = ["0.0.0.0/0"]
  }

  rule {
    direction  = "in"
    protocol   = "tcp"
    port       = "443"
    source_ips = ["0.0.0.0/0"]
  }
}

resource "hcloud_firewall_attachment" "mail" {
  firewall_id = hcloud_firewall.mail.id
  server_ids  = [hcloud_server.mail.id]
}

