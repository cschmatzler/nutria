variable "role" {
  description = "Host's role in the cluster"
  type        = string
}

variable "server_type" {
  description = "Server type"
  type        = string
}

variable "location" {
  description = "Server location"
  type        = string
}

variable "placement_group_id" {
  description = "Server placement group ID"
  type        = number
  nullable    = true
}

variable "image_id" {
  description = "Talos image snapshot ID"
  type        = string
}

variable "user_data" {
  description = "User data"
  type        = string
}

variable "ssh_keys" {
  description = "List of SSH key IDs"
  type        = list(string)
  nullable    = true
}

variable "private_key" {
  description = "SSH private key path"
  type        = string
}

variable "public_key" {
  description = "SSH public key path"
  type        = string
}

variable "network_id" {
  description = "Network ID"
  type        = number
}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
}

variable "rdns_domain" {
  description = "Reverse DNS domain"
  type        = string
}

variable "labels" {
  description = "Labels"
  type        = map(any)
  nullable    = true
}
