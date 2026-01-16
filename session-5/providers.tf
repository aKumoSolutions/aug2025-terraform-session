provider "aws" {
  region = "us-west-2"

  default_tags {
    tags = {
        Environment = var.env
        Business_Unit = var.bu
        Tier = var.tier
        Team = "devop"
        Project_Name = "streaming-ai"
        Managed_by = "terraform"
        Owner = "support@akumosolutions.io"
  }
  }
}
// Default Tag = Enforcement, Eliminates repetition, Automatically applies to all resources

// AWS Only