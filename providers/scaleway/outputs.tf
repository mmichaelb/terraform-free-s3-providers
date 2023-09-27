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
  value = module.access_key.id
}

output "secret_access_key" {
  value = module.access_key.key
}

output "bucket_name" {
  value = scaleway_object_bucket.bucket.name
}

output "storage_class" {
  value = "ONEZONE_IA"
}

output "management_access_key_id" {
  value = var.add_management_key ? module.management_key[0].id : "<unset>"
}

output "management_secret_access_key" {
  value = var.add_management_key ? module.management_key[0].key : "<unset>"
}
