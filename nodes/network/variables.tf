variable "hcloud_token" {
  description = "Hetzner Cloud API Token"
  type        = string
  sensitive   = true
}

variable "public_key" {
  description = "SSH public key path"
  type        = string
}
