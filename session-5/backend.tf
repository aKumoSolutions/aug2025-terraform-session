terraform {
  backend "s3" {
    bucket = "terraform-session-backend-bucket"
    key = "session-5/terraform.tfstate"  // key prefix, path to terraform.tfstate
    region = "us-west-2"
    encrypt = true
  }
}
