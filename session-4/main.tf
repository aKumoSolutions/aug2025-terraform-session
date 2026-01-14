resource "aws_instance" "main" {
  count = 5
  ami           = data.aws_ami.amazon_linux_2023.id
  instance_type = var.instance_type
  vpc_security_group_ids = [ aws_security_group.main.id ]
  tags = merge(
    var.tags, 
    { "Name" = "aws-session-instance-${count.index}" }, # aws-session-instance-0, aws-session-instance-1, aws-session-instance-2
    { "Count" = count.index }
  )
}

# main = second_label

# aws_instance.main --> aws_instance.main[0] = renaming the existing resource

# count, terraform turns one resource block into a list of resources

# [ 0, 1, 2, 3, ... n ] = Terraform uses zero-based indexing

# whole number = 5

# 1 2 3 4 5

# [ 0, 1, 2, 3, 4 ]

# 2 maps
# tags = {
#     "Project" = "aws-session"
#     "Managed_by" = "terraform"
#   }, 
# {
#  "Name" = "aws-session instance"
# }

# Syntax:
# merge( map-1, map-2 )