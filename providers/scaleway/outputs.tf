output "profile_name" {
  value = "scaleway"
}

output "endpoint_url" {
  value = "s3.${var.region}.scw.cloud"
}

output "region" {
  value = var.region
}

output "access_key_id" {
  value = lookup(scaleway_iam_api_key.main, "access_key")
}

output "secret_access_key" {
  value = lookup(scaleway_iam_api_key.main, "secret_key")
}

output "bucket_name" {
  value = scaleway_object_bucket.bucket.name
}

output "storage_class" {
  value = "ONEZONE_IA"
}
