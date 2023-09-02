data "oci_identity_compartment" "main" {
  id = var.compartment_id
}

resource "oci_identity_group" "access" {
  name           = "${var.bucket_name}-access"
  description    = "The IAM group the application will use to access the bucket."
}

resource "oci_identity_user" "access" {
  name           = "${var.bucket_name}-access"
  description    = "The IAM user the application will use to access the bucket."
}

resource "oci_identity_user_group_membership" "access" {
  group_id = oci_identity_group.access.id
  user_id  = oci_identity_user.access.id
}

resource "oci_identity_user_capabilities_management" "access" {
  user_id = oci_identity_user.access.id

  can_use_customer_secret_keys = true
  can_use_api_keys             = false
  can_use_auth_tokens          = false
  can_use_console_password     = false
  can_use_smtp_credentials     = false
}

resource "oci_identity_customer_secret_key" "access" {
  user_id      = oci_identity_user.access.id
  display_name = "${var.bucket_name}-access"
}

resource "oci_identity_policy" "access_write" {
  name           = "${var.bucket_name}-access"
  description    = "The IAM policy the application will use to write to the bucket."
  compartment_id = data.oci_identity_compartment.main.id
  statements     = [
    "Allow group ${oci_identity_group.access.name} to manage objects in compartment ${data.oci_identity_compartment.main.name} where all { target.bucket.name='${var.bucket_name}', request.permission='OBJECT_CREATE' }"
  ]
}
