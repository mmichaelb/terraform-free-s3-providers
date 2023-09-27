module "secrets" {
  source = "../../../sops_secrets"
}

module "oracle" {
  source             = "../"
  bucket_name        = "terraform-free-s3-providers-${terraform.workspace}"
  compartment_id     = module.secrets.data["providers.oracle.compartment_id"]
  region             = "eu-frankfurt-1"
  add_management_key = true
}

provider "oci" {
  tenancy_ocid = module.secrets.data["providers.oracle.tenancy_ocid"]
  user_ocid    = module.secrets.data["providers.oracle.user_ocid"]
  fingerprint  = module.secrets.data["providers.oracle.fingerprint"]
  private_key  = module.secrets.data["providers.oracle.private_key"]
  region       = "eu-frankfurt-1"
}
