variable "org" {
  type = string
  description = "Organization"
  default = "netflix"
}
variable "dep" {
  type = string
  description = "Department"
  default = "it"
}
variable "bu" {
  type = string
  description = "Domain/Business Unit"
  default = "ai"
}
variable "env" {
  type = string
  description = "Environment"
  default = "dev"
}
variable "region" {
  type = string
  description = "Provider Region"
  default = "uw2"
}
variable "tier" {
  type = string
  description = "Tier"
  default = "frontend"
}

# variable "naming" {
#   type = string
#   description = "naming standard"
#   default = "${var.org}-${var.dep}-${var.bu}-${var.env}-${var.region}-${var.tier}-rtype" 
#   // Default must be static
#   // You cannot reference another variable 
# }

# variable "naming" {
#   type = string
#   description = "naming standard"
#   default = "netflix-it-ai-dev-us-east-1-frontend-ec2"
# }

# variable "alb_naming" {
#   type = string
#   description = "naming standard"
#   default = "netflix-it-ai-dev-us-east-1-frontend-alb"
# }
# variable "asg_naming" {
#   type = string
#   description = "naming standard"
#   default = "netflix-it-ai-dev-us-east-1-frontend-asg"
# }