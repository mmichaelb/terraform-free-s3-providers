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
