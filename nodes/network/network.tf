resource "hcloud_network" "nutria" {
  name     = "nutria"
  ip_range = "10.0.0.0/16"
}
