resource "hcloud_network" "medium_place" {
  name     = "medium-place"
  ip_range = "10.0.0.0/16"
}
