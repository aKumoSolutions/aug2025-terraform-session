resource "aws_instance" "first_ec2" {
  ami           = "ami-00a8151272c45cd8e"
  instance_type = "t3.micro"
  tags = {
    Name        = "first"
    Environment = "dev"
  }
}

# resource = block, create and manage resources
# "aws_instance" = first_label, indicate the resource that you want to create and manage, defined by Terraform
# "first_ec2" = second_label, logical id or logical name of the resource, defined by me (Must be unique within working directory)
# argument = key value pair, configuration of the resource, key is defined by Terraform and value is given by us
# Data types: 
# - "" = string
# - {} = map

# t2.micro --> t3.micro = resize the instance (stops, resizes, starts the machine) [downtown time]
# ami-0be2609ba883822ec --> ami-xyz = terminate the instance and creates a new instance [downtown time]
# first --> main = update the tag, nothing happens
