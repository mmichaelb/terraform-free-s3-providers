module "secrets" {
  source = "../../../sops_secrets"
}

module "scaleway" {
  source             = "../"
  bucket_name        = "terraform-free-s3-providers-${terraform.workspace}"
  project_id         = module.secrets.data["providers.scaleway.project_id"]
  region             = "fr-par"
  add_management_key = true
}

provider "scaleway" {
  access_key      = module.secrets.data["providers.scaleway.access_key"]
  secret_key      = module.secrets.data["providers.scaleway.secret_key"]
  project_id      = module.secrets.data["providers.scaleway.project_id"]
  organization_id = module.secrets.data["providers.scaleway.organization_id"]
}
