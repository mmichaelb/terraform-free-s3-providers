resource "scaleway_object_bucket" "bucket" {
  name   = var.bucket_name
  region = var.region
  project_id = var.project_id
}

resource "scaleway_object_bucket_acl" "acl" {
  bucket = scaleway_object_bucket.bucket.name
  acl    = "private"
  project_id = var.project_id
}
