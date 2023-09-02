module "secrets" {
  source = "../../../sops_secrets"
}

module "backblaze" {
  source = "../"
  bucket_name = "terraform-free-s3-providers-${terraform.workspace}"
  override_retention_days = 1
}

provider "b2" {
  application_key_id = module.secrets.data["providers.backblaze.master_application_key_id"]
  application_key = module.secrets.data["providers.backblaze.master_application_key"]
}
