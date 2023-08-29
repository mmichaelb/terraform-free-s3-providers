resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
  lifecycle {
    prevent_destroy = true
  }
  force_destroy = false
}

resource "aws_s3_bucket_policy" "access" {
  bucket = aws_s3_bucket.bucket.bucket
  policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Id" : "S3PolicyAllow-IP",
      "Statement" : [
        {
          "Sid" : "IP-Allow",
          "Effect" : "Allow",
          "Action" : ["s3:PutObject"],
          "Resource" : "*",
          "Condition" : {
            "IpAddress" : { "aws:SourceIp" : [var.instance_ip] },
          }
        }
      ]
    }
  )
}
