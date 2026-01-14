variable "env" {
  type = string
  description = "Environment"
  default = "dev"
}
variable "instance_type" {
  type = string
  description = "This is an Ec2 instance size"
  default = "t3.micro"
}
variable "tags" {
  type = map(string)
  description = "common tags"
  default = {
    "Project" = "aws-session"
    "Managed_by" = "terraform"
  }
}

variable "ports" {
  type = list(string)
  description = "list of ports"
  default = [ "22", "80", "443", "3306"]
}
variable "cidr_blocks" {
  type = list(string)
  description = "list of ports"
  default = [ "0.0.0.0/0", "0.0.0.0/0", "0.0.0.0/0", "10.0.1.0/24"]
}