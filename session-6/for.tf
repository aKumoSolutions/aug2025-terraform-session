resource "aws_sqs_queue" "main" {
  for_each = toset(var.names) // map and set of string (tuple)
  name     = each.key
}

variable "names" {
  type        = list(string)
  description = "This variable is sqs queue names"
  default     = ["queue-1", "queue-2", "queue-3"]
}

// list of strings vs set of strings (tuple)

resource "aws_sqs_queue" "new" {
  for_each = toset(local.names)
  name     = each.key
}

// for = transform values

locals {
  names = [for a in range(1, 3) : "new-queue-${a}"]
}

# Python:
# names = [ f"new-queue-{a}" for a in range(1,3) ]
# print = (names)


// Create a Security group with 2 rules with for each
// Rule-1: 22, 10.0.0.0/16
// Rule-2: 80, 0.0.0.0/0

resource "aws_security_group" "main" {
  name        = "aws-session-sg"
  description = "This is a security group for ec2 instance"
}

resource "aws_security_group_rule" "main" {
  for_each          = local.service // map or set of string
  type              = "ingress"
  from_port         = each.value.port
  to_port           = each.value.port
  protocol          = "tcp"
  cidr_blocks       = [each.value.cidr_blocks]
  security_group_id = aws_security_group.main.id
}
variable "services" { // Global Variable // List of maps
  default = [
    { name = "ssh", port = 22, cidr_blocks = "10.0.0.0/16" },
    { name = "web", port = 80, cidr_blocks = "0.0.0.0/0" }
  ]
}

locals {
  service = {
    for svc in var.services : svc.name => { port = svc.port, cidr_blocks = svc.cidr_blocks }
  }
}
# local.service
# {
# ssh = {
#     port = 22
#     cidr_blocks = "10.0.0.0/16"
#     }
# web = {
#     port = 80
#     cidr_blocks = "0.0.0.0/0"
#     }
# }

# locals {
#     service_ports = {
#         for svc in var.services : svc.name => svc.port
#     }
#     service_cidr_blocks = {
#         for svc in var.services : svc.name => svc.cidr_blocks
#     }
# }

# local.service_ports 
# {
#     ssh = 22
#     web = 80
# }

# local.service_cidr_blocks
# {
#     ssh = "10.0.0.0/16"
#     web = "0.0.0.0/0"
# }




// Situation: a value = list of maps
// Task: transform the value to map
// Action: for
// Result: pass a transformed value to security group