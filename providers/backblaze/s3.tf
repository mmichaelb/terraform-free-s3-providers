locals {
  lifecycle_rules = var.override_retention_days == -1 ? [] : [
    {
      file_name_prefix              = ""
      days_from_uploading_to_hiding = var.override_retention_days
      days_from_hiding_to_deleting  = 1
    }
  ]
}

resource "b2_bucket" "bucket" {
  bucket_name = var.bucket_name
  bucket_type = "allPrivate"

  dynamic "lifecycle_rules" {
    for_each = local.lifecycle_rules
    content {
      file_name_prefix              = lifecycle_rules.value["file_name_prefix"]
      days_from_uploading_to_hiding = lifecycle_rules.value["days_from_uploading_to_hiding"]
      days_from_hiding_to_deleting  = lifecycle_rules.value["days_from_hiding_to_deleting"]
    }
  }
}

data "b2_account_info" "general" {}
