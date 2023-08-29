resource "scaleway_iam_application" "access" {
  name            = "${var.bucket_name}-access"
  description     = "S3 Access Application."
  organization_id = var.organization_id
}

resource "scaleway_iam_policy" "access_put_only" {
  name        = "${var.bucket_name}-access-put-only"
  description = "S3 Put Only Policy for the application."
  application_id = scaleway_iam_application.access.id
  rule {
    project_ids = [scaleway_account_project.access.id]
    permission_set_names = ["ObjectStorageObjectsWrite"]
  }
  organization_id = var.organization_id
}

resource "scaleway_iam_api_key" "main" {
  application_id     = scaleway_iam_application.access.id
  description        = "The access token the application uses to access the bucket."
  default_project_id = scaleway_account_project.access.id
}
