terraform {
  backend "s3" {
    bucket  = "terraform-session-backend-bucket"
    key     = "terraform.tfstate" 
    region  = "us-west-2"
    encrypt = true
    workspace_key_prefix = "project-14"
  }
}

// Each workspace will have its own Backend file (terraform.tfstate)
// Backend file
// Syntax: workspace_key_prefix/workspace_name/key
// Example: project-14/default/terraform.tfstate

// Expect: project-14/dev/terraform.tfstate