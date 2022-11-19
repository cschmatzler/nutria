resource "hcloud_network_subnet" "cluster" {
  network_id   = hcloud_network.medium_place.id
  type         = "cloud"
  network_zone = "eu-central"
  ip_range     = cidrsubnet(hcloud_network.medium_place.ip_range, 8, 1)
}
