resource "aws_kms_key" "project1key" {
  description             = "This is the key for our repo"
  deletion_window_in_days = 30
}

resource "aws_s3_bucket" "project1-bucket" {
  bucket = "bootcamp30-07-stella"

#   server_side_encryption_configuration {
#     rule {
#       apply_server_side_encryption_by_default {
#         kms_master_key_id = aws_kms_key.projectkey.arn
#         sse_algorithm     = "aws:kms"
#       }
#     }
#   }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "project1_s3" {
  bucket = aws_s3_bucket.project1-bucket.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.project1key.arn
      sse_algorithm     = "aws:kms"
    }
  }
}
