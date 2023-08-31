terraform {
  required_version = ">=1.5.6"
  required_providers {
    scaleway = {
      source  = "scaleway/scaleway"
      version = "2.27.0"
    }
    sops = {
      source  = "carlpett/sops"
      version = "0.7.2"
    }
  }
}
