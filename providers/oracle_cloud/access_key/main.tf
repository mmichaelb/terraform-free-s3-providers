resource "oci_identity_group" "main" {
  name        = "${var.bucket_name}-${var.access_verb}"
  description = "The IAM group the application will use to ${var.access_verb} the bucket."
}

resource "oci_identity_user" "main" {
  name        = "${var.bucket_name}-${var.access_verb}"
  description = "The IAM user the application will use to ${var.access_verb} the bucket."
}

resource "oci_identity_user_group_membership" "main" {
  group_id = oci_identity_group.main.id
  user_id  = oci_identity_user.main.id
}

resource "oci_identity_user_capabilities_management" "main" {
  user_id = oci_identity_user.main.id

  can_use_customer_secret_keys = true
  can_use_api_keys             = false
  can_use_auth_tokens          = false
  can_use_console_password     = false
  can_use_smtp_credentials     = false
}

resource "oci_identity_customer_secret_key" "main" {
  user_id      = oci_identity_user.main.id
  display_name = "${var.bucket_name}-${var.access_verb}"
}

locals {
  permissions_formatted = [for permission in var.permissions : "request.permission='${permission}'"]
  permissions_concat = join(", ", local.permissions_formatted)
}

resource "oci_identity_policy" "main" {
  name           = "${var.bucket_name}-${var.access_verb}"
  description    = "The IAM policy the application will use to ${var.access_verb} the bucket."
  compartment_id = var.oci_identity_compartment.id
  statements     = [
    "Allow group ${oci_identity_group.main.name} to manage objects in compartment ${var.oci_identity_compartment.name} where all { target.bucket.name='${var.bucket_name}', any { ${local.permissions_concat} } }"
  ]
}
