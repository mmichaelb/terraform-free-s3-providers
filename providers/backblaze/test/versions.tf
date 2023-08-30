terraform {
  required_providers {
    b2 = {
      source  = "Backblaze/b2"
      version = "0.8.4"
    }
    sops = {
      source  = "carlpett/sops"
      version = "0.7.2"
    }
  }
}
