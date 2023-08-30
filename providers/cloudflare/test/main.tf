module "secrets" {
  source = "../../../sops_secrets"
}

module "cloudflare" {
  source = "../"
  bucket_name = "terraform-free-s3-providers-${terraform.workspace}"
  account_id = module.secrets.data["providers.cloudflare.account_id"]
  region = "WEUR"
}

provider "cloudflare" {
  api_token = module.secrets.data["providers.cloudflare.api_key"]
}
