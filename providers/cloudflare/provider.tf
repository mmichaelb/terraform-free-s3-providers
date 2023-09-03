locals {
  endpoint_url = "${var.account_id}.r2.cloudflarestorage.com"
}

terraform {
  required_version = ">= 1.0.0"
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
      version = ">= 4.0.0"
    }
  }
}
