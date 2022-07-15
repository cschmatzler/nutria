resource "hcloud_network_subnet" "cluster" {
  network_id   = hcloud_network.nutria.id
  type         = "cloud"
  network_zone = "eu-central"
  ip_range     = cidrsubnet(hcloud_network.nutria.ip_range, 8, 1)
}
