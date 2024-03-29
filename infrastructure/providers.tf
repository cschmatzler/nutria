terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = ">= 1.0.0"
    }
    hetznerdns = {
      source  = "timohirt/hetznerdns"
      version = ">= 2.0.0"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = ">= 3.0.0"
    }
  }
}

provider "hcloud" {
  token = var.hcloud_token
}

provider "hetznerdns" {
  apitoken = var.hdns_token
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}
