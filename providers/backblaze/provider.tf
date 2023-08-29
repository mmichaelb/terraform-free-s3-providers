provider "b2" {
  application_key_id = var.master_application_key_id
  application_key = var.master_application_key
}

terraform {
  required_providers {
    b2 = {
      source = "Backblaze/b2"
    }
  }
}
