// Create 2 S3 buckets with same resource block;
// Names: terraform-session-aug2025-yourname-1, terraform-session-aug2025-yourname-2
// object_lock_enabled : true, object_lock_enabled : false
// acl:  private, acl: public-read
// Tag: Name = bucket-1, Name = bucket-2

resource "aws_s3_bucket" "main" {
  for_each            = var.buckets
  bucket              = each.value.name
  object_lock_enabled = each.value.object_lock_enabled
  tags = {
    Name = each.key
  }
}

// Input Variable is to configure resources. 
variable "buckets" {
  description = "This is a map for buckets"
  type        = map(any) // map of strings, bool, number
  default = {
    bucket-1 = {
      name                = "terraform-session-aug2025-kris-1",
      object_lock_enabled = true
    }
    bucket-2 = {
      name                = "terraform-session-aug2025-kris-2",
      object_lock_enabled = false
    }
  }
}

// count = main[0], main[1]
// for_each = aws_s3_bucket.main["bucket-1"], aws_s3_bucket.main["bucket-2"]