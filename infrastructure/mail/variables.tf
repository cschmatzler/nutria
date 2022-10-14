variable "ssh_key_id" {
  description = "Hetzner SSH key ID"
  type        = string
}

variable "database_root_password" {
  description = "Root password for MySQL database"
  type        = string
  sensitive   = true
}

variable "database_password" {
  description = "Password for MySQL database"
  type        = string
  sensitive   = true
}
