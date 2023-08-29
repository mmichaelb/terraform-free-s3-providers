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
  value = oci_identity_customer_secret_key.access.id
}

output "secret_access_key" {
  value = oci_identity_customer_secret_key.access.key
}

output "bucket_name" {
  value = oci_objectstorage_bucket.bucket.name
}

output "use_path_style" {
  value = true
}
