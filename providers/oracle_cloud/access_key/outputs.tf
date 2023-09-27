output "id" {
  value = oci_identity_customer_secret_key.main.id
}

output "key" {
  value = sensitive(oci_identity_customer_secret_key.main.key)
}
