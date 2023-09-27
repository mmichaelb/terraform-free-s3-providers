data "cloudflare_api_token_permission_groups" "all" {}

resource "cloudflare_api_token" "access" {
  name = "${var.bucket_name}-access"
  policy {
    permission_groups = [
      lookup(data.cloudflare_api_token_permission_groups.all, "r2")["Workers R2 Storage Bucket Item Write"]
    ]
    resources = {
      "com.cloudflare.edge.r2.bucket.${var.account_id}_default_${var.bucket_name}" = "*"
    }
  }
}

resource "cloudflare_api_token" "management" {
  count = var.add_management_key ? 1 : 0
  name  = "${var.bucket_name}-management"
  policy {
    permission_groups = [
      lookup(data.cloudflare_api_token_permission_groups.all, "r2")["Workers R2 Storage Bucket Item Write"],
      lookup(data.cloudflare_api_token_permission_groups.all, "r2")["Workers R2 Storage Bucket Item Read"]
    ]
    resources = {
      "com.cloudflare.edge.r2.bucket.${var.account_id}_default_${var.bucket_name}" = "*"
    }
  }
}
