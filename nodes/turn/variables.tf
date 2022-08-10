variable "hcloud_token" {
  description = "Hetzner Cloud API Token"
  type        = string
  sensitive   = true
}

variable "ssh_key_id" {
  description = "Hetzner SSH key ID"
  type        = string
}

variable "turn_secret" {
  description = "TURN secret"
  type        = string
}
