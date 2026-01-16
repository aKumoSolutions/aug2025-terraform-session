resource "aws_sqs_queue" "main" {
  name = replace( local.name, "rtype", "sqs" )
  tags = merge(
    local.common_tags, 
    { Name = replace( local.name, "rtype", "sqs" ) }
  )
}

resource "aws_db_instance" "main" {
  identifier = replace( local.name, "rtype", "rds" ) // AWS RDS Instance Name
  allocated_storage    = 10
  db_name              = "mydb" // Database Name inside the instance
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = "admin"
  password             = random_password.password.result // AWS Secrets Manager for RDS password
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = var.env != "prod" ? true : false
  final_snapshot_identifier = var.env != "prod" ? null : "${replace( local.name, "rtype", "snapshot" )}-${formatdate("YYYYMMDDHHmmss", timestamp())}"
}

// If environment is Dev, I don't want a snapshot
// If environment is Prod, I want a snapshot

// What if environment is QA?

resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

output "random_password" {
  value = random_password.password.result
  sensitive = true
}

output "db_password" {
  value = aws_db_instance.main.password
  sensitive = true
}
// Reference to Local value
# Syntax: local.local_value
# Example: local.name

# Equality Operator:
# 1 == "1"
# >> false

# kris == kris
# >> true

# kris != john
# >> true 

// Conditional Expression
// Syntax: condition ? first_value : second_value

# Example:

# "apple" == "apple" ? "great" : "okay"
# >> "great"

# "grape" != "tomato" ? "5" : "10"
# >> "5"

# var.env != var.tier ? var.team : var.bu
# >> var.team 

# 8 == 5 ? "no" : 8 == 6 ? "no" : 8 == 7 ? "yes" : 8 == 8 ? false: true
# >> false

# Conditional Expression: until you have 3 conditions
# Conditional Hell: when you have more than 3 conditions 