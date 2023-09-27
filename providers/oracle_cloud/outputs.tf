output "profile_name" {
  value = "oracle_cloud"
}

output "endpoint_url" {
  value = "${data.oci_objectstorage_namespace.general.namespace}.compat.objectstorage.${var.region}.oraclecloud.com"
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
  value = oci_objectstorage_bucket.bucket.name
}

output "use_path_style" {
  value = true
}

output "management_access_key_id" {
  value = var.add_management_key ? module.management_key[0].id : "<unset>"
}

output "management_secret_access_key" {
  value = var.add_management_key ? module.management_key[0].key : "<unset>"
}
