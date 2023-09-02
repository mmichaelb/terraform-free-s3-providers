terraform {
  required_version = ">=1.5.6"
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "5.11.0"
    }
    sops = {
      source  = "carlpett/sops"
      version = "0.7.2"
    }
  }
}
