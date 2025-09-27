# s3.tf
resource "random_id" "id" {
  byte_length = 8
}

resource "aws_s3_bucket" "bandcamp_data_staging" {
  bucket = "bandcamp-sales-data-staging-${random_id.id.hex}"

  tags = {
    Project = "Bandcamp Data Warehouse"
  }
}

resource "aws_s3_bucket_versioning" "staging_versioning" {
  bucket = aws_s3_bucket.bandcamp_data_staging.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "staging_pab" {
  bucket = aws_s3_bucket.bandcamp_data_staging.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}