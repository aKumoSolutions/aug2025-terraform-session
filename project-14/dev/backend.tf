terraform {
  backend "s3" {
    bucket  = "terraform-session-backend-bucket"
    key     = "project-14/dev/terraform.tfstate" 
    region  = "us-west-2"
    encrypt = true
  }
}