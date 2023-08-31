output "profile_name" {
  value = "cloudflare"
}

output "endpoint_url" {
  value = local.endpoint_url
}

output "region" {
  value = var.region
}

output "access_key_id" {
  value = cloudflare_api_token.access.id
}

output "secret_access_key" {
  value = sha256(cloudflare_api_token.access.value)
}

output "bucket_name" {
  value = cloudflare_r2_bucket.bucket.id
}
