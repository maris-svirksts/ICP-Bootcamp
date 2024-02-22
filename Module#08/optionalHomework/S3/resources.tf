resource "aws_s3_bucket" "userdata" {
  bucket        = var.userdata
  force_destroy = true
}

resource "aws_s3_bucket" "website" {
  bucket        = var.website
  force_destroy = true

  /*cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET", "POST"]
    allowed_origins = ["*"]
    expose_headers  = ["ETag"]
    max_age_seconds = 3000
  }*/
}


resource "aws_s3_bucket_public_access_block" "accessBlock" {
  bucket = aws_s3_bucket.website.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}


resource "aws_s3_bucket_website_configuration" "configuration" {
  bucket = aws_s3_bucket.website.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

# Bucket policy to allow public read access for website content
resource "aws_s3_bucket_policy" "website_policy" {
  bucket = aws_s3_bucket.website.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = ["s3:GetObject"]
        Effect    = "Allow"
        Resource  = ["${aws_s3_bucket.website.arn}/*"]
        Principal = "*"
        Sid       = "PublicReadGetObject"
      },
    ]
  })

  depends_on = [aws_s3_bucket_public_access_block.accessBlock]
}
