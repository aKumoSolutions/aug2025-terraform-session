resource "aws_sqs_queue" "main" {
    name = "${var.env}-queue"
}
variable "env" {
  default = "dev"
}

resource "aws_instance" "main" {
  ami           = "ami-00a8151272c45cd8e"
  instance_type = "t3.micro"
  tags = {
    Name        = "first"
    Environment = "dev"
  }
}

// Import Manual Resource, +v1.5
import {
    to = aws_sqs_queue.manual // first and second labels for our manual
    id = "https://sqs.us-west-2.amazonaws.com/055670655228/terraform-last-session"
}

resource "aws_sqs_queue" "manual" {}