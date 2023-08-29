locals {
  endpoint_url = "https://${var.account_id}.r2.cloudflarestorage.com"
  region       = "weur"
}

provider "cloudflare" {
  api_token = var.api_token
}

terraform {
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
    }
  }
}
