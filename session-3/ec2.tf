resource "aws_instance" "main" {
  ami           = data.aws_ami.amazon_linux_2023.id
  instance_type = var.instance_type
  vpc_security_group_ids = [ aws_security_group.main.id ] // a list of strings (one or more strings in the list)
  tags = var.tags
}

// second label must be unique 
// as long as these are different resources (first_label), you can use the same name

// Example:
// aws_instance.main
// aws_security_group.main

// ids = [ ]

// Reference to Resource = Reference to an attribute of the resource that already exist
// Syntax: first_label.second_label.attribute
// By default, Terraform has implicit dependency

// Reference to Input Variable
// Syntax: var.variable_name
// Example: var.instance_type

// Resource Type/Block is to create and manage resources 

// Data Source Type/Block is to fetch the data from existing resources

// Reference to Data Source?
// Syntax: data.first_label.second_label.attribute