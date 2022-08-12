# Control plane load balancer 
# ---------------------------
resource "hcloud_load_balancer" "control_plane" {
  name               = "control-plane"
  load_balancer_type = "lb11"
  location           = "fsn1"
}

resource "hcloud_load_balancer_network" "nutria" {
  load_balancer_id = hcloud_load_balancer.control_plane.id
  network_id       = var.network_id
}

resource "hcloud_load_balancer_service" "control_plane" {
  load_balancer_id = hcloud_load_balancer.control_plane.id
  protocol         = "tcp"
  listen_port      = 6443
  destination_port = 6443
}

# Control plane DNS
# -----------------
data "hetznerdns_zone" "nutria" {
  name = "nutria.cloud"
}

resource "hetznerdns_record" "cluster" {
  zone_id = data.hetznerdns_zone.nutria.id
  type    = "A"
  ttl     = 60
  name    = "cluster"
  value   = hcloud_load_balancer.control_plane.ipv4
}
