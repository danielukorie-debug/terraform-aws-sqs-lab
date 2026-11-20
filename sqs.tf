resource "aws_sqs_queue" "dead_letter" {
  name = "terraform-sqs-lab-dlq"

  message_retention_seconds = 1209600
  sqs_managed_sse_enabled   = true

  tags = {
    Project     = "terraform-aws-sqs-lab"
    Environment = "learning"
    ManagedBy   = "Terraform"
  }
}

resource "aws_sqs_queue" "main" {
  name = "terraform-sqs-lab-main"

  delay_seconds              = 0
  max_message_size           = 262144
  message_retention_seconds  = 345600
  receive_wait_time_seconds  = 10
  visibility_timeout_seconds = 30

  sqs_managed_sse_enabled = true

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.dead_letter.arn
    maxReceiveCount     = 5
  })

  tags = {
    Project     = "terraform-aws-sqs-lab"
    Environment = "learning"
    ManagedBy   = "Terraform"
  }
}
