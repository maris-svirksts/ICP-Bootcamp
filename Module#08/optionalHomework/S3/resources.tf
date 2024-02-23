# Define the S3 bucket for user data with forced destruction enabled.
resource "aws_s3_bucket" "userdata" {
  bucket        = var.userdata
  force_destroy = true
}

# Define the S3 bucket for website content with forced destruction enabled.
resource "aws_s3_bucket" "website" {
  bucket        = var.website
  force_destroy = true
}

# Configure public access settings for the website bucket.
resource "aws_s3_bucket_public_access_block" "accessBlock" {
  bucket = aws_s3_bucket.website.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# Setup website configuration for the S3 bucket.
resource "aws_s3_bucket_website_configuration" "configuration" {
  bucket = aws_s3_bucket.website.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

# Define a bucket policy to allow public read access to the website content.
resource "aws_s3_bucket_policy" "website_policy" {
  bucket = aws_s3_bucket.website.id

  policy = jsonencode({
    Version   = "2012-10-17"
    Statement = [
      {
        Action    = ["s3:GetObject"]
        Effect    = "Allow"
        Resource  = "${aws_s3_bucket.website.arn}/*"
        Principal = "*"
        Sid       = "PublicReadGetObject"
      },
    ]
  })

  depends_on = [aws_s3_bucket_public_access_block.accessBlock]
}
