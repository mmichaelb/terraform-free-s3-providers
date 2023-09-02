resource "oci_objectstorage_bucket" "bucket" {
  name           = var.bucket_name
  namespace      = data.oci_objectstorage_namespace.general.namespace
  access_type    = "NoPublicAccess"
  compartment_id = data.oci_identity_compartment.main.id
}

data "oci_objectstorage_namespace" "general" {
  compartment_id = var.compartment_id
}
