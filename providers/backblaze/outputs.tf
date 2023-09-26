output "profile_name" {
  value = "backblaze"
}

output "endpoint_url" {
  value = trimprefix(data.b2_account_info.general.s3_api_url, "https://")
}

output "region" {
  value = regex("s3.([\\w-]+).backblazeb2.com", data.b2_account_info.general.s3_api_url)[0]
}

output "access_key_id" {
  value = b2_application_key.access.application_key_id
}

output "secret_access_key" {
  value = b2_application_key.access.application_key
}

output "bucket_name" {
  value = b2_bucket.bucket.bucket_name
}
