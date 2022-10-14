resource "hcloud_volume" "mail" {
  name      = "mail.nutria.cloud"
  server_id = hcloud_server.mail.id
  size      = 10
  automount = true
  format    = "ext4"
}
