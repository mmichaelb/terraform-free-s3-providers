resource "b2_bucket" "bucket" {
  bucket_name = var.bucket_name
  bucket_type = "allPrivate"

  lifecycle {
    prevent_destroy = true
  }
}

data "b2_account_info" "general" {}
