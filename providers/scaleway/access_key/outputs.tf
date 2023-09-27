output "id" {
  value = scaleway_iam_api_key.main.access_key
}

output "key" {
  value = scaleway_iam_api_key.main.secret_key
}
