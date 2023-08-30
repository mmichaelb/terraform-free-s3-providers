data "sops_file" "secrets" {
  source_file = "${path.module}/../secrets.json"
}

locals {
    secrets_data = data.sops_file.secrets.data
}
