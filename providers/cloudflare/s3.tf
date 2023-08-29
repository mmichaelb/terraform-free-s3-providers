resource "cloudflare_r2_bucket" "bucket" {
  account_id = var.account_id
  name       = var.bucket_name
  lifecycle {
    prevent_destroy = true
  }
}
