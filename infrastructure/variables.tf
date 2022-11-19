variable "hcloud_token" {
  description = "Hetzner Cloud API Token"
  type        = string
  sensitive   = true
}

variable "hdns_token" {
  description = "Hetzner DNS API Token"
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

variable "image_id" {
  description = "Talos image snapshot ID"
  type        = string
}

variable "mail_database_root_password" {
  description = "Root password for MySQL database"
  type        = string
  sensitive   = true
}

variable "mail_database_password" {
  description = "Password for MySQL database"
  type        = string
  sensitive   = true
}

variable "turn_secret" {
  description = "TURN secret"
  type        = string
}
