resource "scaleway_iam_application" "main" {
  name        = "${var.bucket_name}-${var.access_verb}"
  description = "S3 ${var.access_verb} Application."
}

resource "scaleway_iam_policy" "main" {
  name           = "${var.bucket_name}-${var.access_verb}"
  description    = "S3 Policy for the application to ${var.access_verb} the bucket."
  application_id = scaleway_iam_application.main.id
  rule {
    project_ids          = [var.project_id]
    permission_set_names = var.permissions
  }
}

resource "scaleway_iam_api_key" "main" {
  application_id     = scaleway_iam_application.main.id
  description        = "The token the application uses to ${var.access_verb} the bucket."
  default_project_id = var.project_id
}
