variable "hcloud_token" {
  description = "Hetzner Cloud API Token"
  type        = string
  sensitive   = true
}

variable "cloudflare_api_token" {
  description = "Cloudflare API Token"
  type        = string
  sensitive   = true
}

variable "private_key" {
  description = "SSH private key path"
  type        = string
}

variable "public_key" {
  description = "SSH public key path"
  type        = string
}

variable "ssh_key_id" {
  description = "Hetzner SSH key ID"
  type        = string
}

variable "network_id" {
  description = "Hetzner network ID"
  type        = string
}

variable "subnet_id" {
  description = "Hetzner control plane subnet ID"
  type        = string
}

variable "image_id" {
  description = "Talos image snapshot ID"
  type        = string
}
