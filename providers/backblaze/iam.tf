resource "b2_application_key" "access" {
  key_name = "${var.bucket_name}-access"
  capabilities = ["writeFiles"]
  bucket_id = lookup(b2_bucket.bucket, "bucket_id")
}
