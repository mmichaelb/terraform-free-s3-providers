provider "scaleway" {
  access_key      = var.access_key
  secret_key      = var.secret_key
  organization_id = var.organization_id
}

terraform {
  required_providers {
    scaleway = {
      source  = "scaleway/scaleway"
    }
  }
}

resource "scaleway_account_project" "access" {
  name = var.project_name
  description = "Project used to hold the resources required to interact with the bucket."
}
