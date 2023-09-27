data "oci_identity_compartment" "main" {
  id = var.compartment_id
}

module "access_key" {
  source                   = "./access_key"
  access_verb              = "access"
  bucket_name              = var.bucket_name
  oci_identity_compartment = data.oci_identity_compartment.main
  permissions              = [
    "OBJECT_CREATE",
    "OBJECT_OVERWRITE"
  ]
}

module "management_key" {
  count                    = var.add_management_key ? 1 : 0
  source                   = "./access_key"
  access_verb              = "management"
  bucket_name              = var.bucket_name
  oci_identity_compartment = data.oci_identity_compartment.main
  permissions              = [
    "OBJECT_INSPECT",
    "OBJECT_VERSION_DELETE",
    "OBJECT_DELETE"
  ]
}
