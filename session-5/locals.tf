// Naming Standard/Convention

// Example = netflix-it-ai-dev-us-east-1-frontend-ec2

# 1. Organization = netflix
# 2. Department = it
# 3. Domain/Business Unit = ai
# 4. Environment = dev
# 5. Region = us-east-1 / ue1
# 6. Tier = frontend
# 7. Resource Type = ec2 

locals {
  // Naming Standard
  name = "${var.org}-${var.dep}-${var.bu}-${var.env}-${var.region}-${var.tier}-rtype"

  // Common Tags
  common_tags = {
    Environment = var.env
    Business_Unit = var.bu
    Tier = var.tier
    Team = "devop"
    Project_Name = "streaming-ai"
    Managed_by = "terraform"
    Owner = "support@akumosolutions.io"
  }
}

// Tagging Standard/Convention
// Common tags (Cost Allocation Tag)

# 1. Environment = dev
# 2. Domain/Business_Unit = ai
# 3. Tier = frontend 
# 4. Team = devops, cloud
# 5. Project_Name = playback-ai
# 6. Managed_by = terraform, manual
# 7. Owner = support@akumosolutions.io

// Local values with tags = workes across provider, 