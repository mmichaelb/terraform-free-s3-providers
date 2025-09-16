terraform {
  required_version = ">=1.5.6"
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "5.10.0"
    }
    sops = {
      source  = "carlpett/sops"
      version = "0.7.2"
    }
  }
}
