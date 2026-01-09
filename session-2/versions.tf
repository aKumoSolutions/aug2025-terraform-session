terraform {
  required_version = "~> 1.14.0" // Terraform Version
  required_providers {  // Provider Version
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.28.0"
    }
  }
}

// Semantic Versioning = v3.24.0-beta
// 3 = Major Version (Upgrade) 
// 24 = Minor Version (Update) = features
// 0 = Patch Version (Patch) = fix vulnerabilities
// alpha1 = Experiments
// beta1 = Almost ready, but with some issues

# ~> = Lazy constraints
# "~> 0.14.0" = "0.14.0 - 0.14.x"
# ">= 0.14.0, <0.15" = 0.14.x