resource "scaleway_iam_application" "access" {
  name            = "${var.bucket_name}-access"
  description     = "S3 Access Application."
}

resource "scaleway_iam_policy" "access_put_only" {
  name        = "${var.bucket_name}-access"
  description = "S3 Put Only Policy for the application."
  application_id = scaleway_iam_application.access.id
  rule {
    project_ids = [var.project_id]
    permission_set_names = ["ObjectStorageObjectsWrite"]
  }
}

resource "scaleway_iam_api_key" "main" {
  application_id     = scaleway_iam_application.access.id
  description        = "The access token the application uses to access the bucket."
  default_project_id = var.project_id
}
