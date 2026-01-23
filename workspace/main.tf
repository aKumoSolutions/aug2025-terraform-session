resource "aws_sqs_queue" "main" {
    name = "${terraform.workspace}-queue"
    tags = {
        Name = "${terraform.workspace}-queue"
    }
}

// Reference to Workspace
// Syntax: terraform.workspace
// Example: dev-queue