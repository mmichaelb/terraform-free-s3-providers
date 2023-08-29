resource "scaleway_object_bucket" "bucket" {
  name   = var.bucket_name
  region = var.region
  lifecycle {
    prevent_destroy = true
  }
  project_id = scaleway_account_project.access.id
}

resource "scaleway_object_bucket_acl" "acl" {
  bucket = scaleway_object_bucket.bucket.name
  acl    = "private"
  project_id = scaleway_account_project.access.id
}
