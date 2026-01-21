terraform {
  backend "s3" {
    bucket  = "terraform-session-backend-bucket"
    key     = "session-7/_env_/terraform.tfstate" 
    region  = "us-west-2"
    encrypt = true
  }
}

// 10 projects
// Each project has _env_, qa, stage, _env_ environments.
// 40 different infrastructure


// We can't use variables in terraform backend block such var.env
// We need to isolate tfstate files to isolate environment