# S3 bucket for website.
resource "aws_s3_bucket" "bucky" {
  bucket = "${var.bucket_name}"
}

resource "aws_s3_bucket_policy" "policy" {
  bucket = aws_s3_bucket.bucky.id
  policy = templatefile("templates/s3_policy.json", { bucket = "${var.bucket_name}" })
}

resource "aws_s3_bucket_acl" "acl" {
  bucket = aws_s3_bucket.bucky.id
  acl    = "public-read"
}

# So that all files in the bucket are encryted at rest
resource "aws_s3_bucket_server_side_encryption_configuration" "encrypt" {
  bucket = aws_s3_bucket.bucky.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "AES256"
    }
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.bucky.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_cors_configuration" "cors" {
  bucket = aws_s3_bucket.bucky.id

  cors_rule {
    allowed_headers = ["Authorization", "Content-Length"]
    allowed_methods = ["GET", "POST"]
    allowed_origins = ["https://www.${var.domain_name}"]
    max_age_seconds = 3000
  }

  cors_rule {
    allowed_methods = ["GET"]
    allowed_origins = ["*"]
  }
}


resource "aws_s3_bucket_website_configuration" "web_bucket" {
  bucket = aws_s3_bucket.bucky.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "404.html"
  }

}

# Uploads all the site files to the bucket
resource "aws_s3_object" "site_files" {
  for_each = fileset("../site-contents", "**")
  bucket = aws_s3_bucket.bucky.id
  key    = each.value
  source = "../site-contents/${each.value}"
  # etag makes the file update when it changes; see https://stackoverflow.com/questions/56107258/terraform-upload-file-to-s3-on-every-apply
  etag   = filemd5("../site-contents/${each.value}")
  content_type = lookup(local.mime_types, regex("\\.[^.]+$", each.value), null) # Sets the mime type based on the mime.json lookup file
}
