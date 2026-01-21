// re-useable 
resource "aws_sqs_queue" "main" {
    name = format("%s-sqs-queue", var.env)
}
// dev-sqs-queue
// prod-sqs-queue

variable "env" {
  type = string
  description = "Environment"
  default = "dev"
}
// terraform plan, terraform apply