output "profile_name" {
  value = "tebi"
}

output "endpoint_url" {
  value = local.endpoint_url
}

output "region" {
  value = local.region
}

output "access_key_id" {
  value = "doesnotmatter"
}

output "secret_access_key" {
  value = "ipbasedauthentication"
}

output "bucket_name" {
  value = aws_s3_bucket.bucket.id
}
