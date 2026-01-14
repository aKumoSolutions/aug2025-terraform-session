resource "aws_security_group" "main" {
  name        = "aws-session-sg"
  description = "This is a security group for ec2 instance"
  tags = merge(
    var.tags,
    { "Name" = "${var.env}-security-group" }, // Most popular
    { "Name1" = format("%s-security-group", var.env) }
  )
}
# %s = string
# %d = number

resource "aws_security_group_rule" "main" {
  count = length(var.ports)
  type              = "ingress"
  from_port         = element( var.ports, count.index )
  to_port           = var.ports[count.index] // Terraform 0.12
  protocol          = "tcp"
  cidr_blocks       = [ var.cidr_blocks[count.index] ]
  security_group_id = aws_security_group.main.id
}

resource "aws_security_group_rule" "main_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1" # tcp, udp, icmp
  cidr_blocks       = [ "0.0.0.0/0" ]
  security_group_id = aws_security_group.main.id
}

# from = 0, to = 65535 (it will open 65535 ports)
# from = 22, to = 22 (it will only port 22)

# egress = we don't manage
# ALL ports, ALL protocol to 0.0.0.0/0

# Example: 22, 80, 443, 3306, 5432

# element function = retreive an element from a list

# Syntax:
# element([list], index)

# Example:
# element( ["apple", "orange", "grape"], 2 )
# >> grape

# element( [ 7, 5, 4, 3, 2, 6, 7, 8], 5 )
# >> 6


# Example:
# format("Hello, %s!", "Ander")
# >> "Hello Ander!"