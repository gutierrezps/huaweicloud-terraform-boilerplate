data "huaweicloud_account" "current" {}

resource "huaweicloud_obs_bucket" "main" {
  bucket = var.bucket_name
  acl    = "private"
}

resource "huaweicloud_identity_user" "main" {
  name        = var.iam_username == null ? var.bucket_name : var.iam_username
  access_type = "programmatic"
  pwd_reset   = false
}

resource "huaweicloud_identity_access_key" "main" {
  user_id     = huaweicloud_identity_user.main.id
  secret_file = "output/obs-credentials.csv"
}

resource "huaweicloud_obs_bucket_policy" "main" {
  bucket = huaweicloud_obs_bucket.main.bucket

  policy = jsonencode({
    Statement = [
      {
        Sid       = "AllowReadWrite",
        Effect    = "Allow",
        NotAction = ["DeleteBucket", "PutBucketPolicy", "PutBucketAcl"],
        Resource  = ["${var.bucket_name}", "${var.bucket_name}/*"],
        Principal = {
          "ID" = "domain/${data.huaweicloud_account.current.id}:user/${huaweicloud_identity_user.main.id}"
        }
      }
    ]
  })
}
