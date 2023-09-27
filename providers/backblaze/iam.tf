resource "b2_application_key" "access" {
  key_name     = "${var.bucket_name}-access"
  capabilities = ["writeFiles"]
  bucket_id    = lookup(b2_bucket.bucket, "bucket_id")
}

resource "b2_application_key" "management" {
  count        = var.add_management_key ? 1 : 0
  key_name     = "${var.bucket_name}-management"
  capabilities = ["deleteFiles", "listFiles", "writeFiles"]
  bucket_id    = lookup(b2_bucket.bucket, "bucket_id")
}
