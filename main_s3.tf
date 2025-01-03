resource "aws_s3_bucket" "object" {
  bucket = "${var.short_prefix}-${var.region.short}-${var.account_id}"

  tags = merge(
    {
      Name = "${var.short_prefix}-${var.region.short}-${var.account_id}"
    },
  var.tags)
  force_destroy = !var.persist
}

resource "aws_s3_bucket_versioning" "object" {
  bucket = aws_s3_bucket.object.bucket
  versioning_configuration {
    status = var.versioning || var.replication /|| var.replicate_region != null/ ? "Enabled" : "Disabled"
  }
}
