output "main_queue_url" {
  description = "Main SQS queue URL after deployment."
  value       = aws_sqs_queue.main.url
}

output "main_queue_arn" {
  description = "Main SQS queue ARN after deployment."
  value       = aws_sqs_queue.main.arn
}

output "dead_letter_queue_url" {
  description = "Dead-letter queue URL after deployment."
  value       = aws_sqs_queue.dead_letter.url
}

output "dead_letter_queue_arn" {
  description = "Dead-letter queue ARN after deployment."
  value       = aws_sqs_queue.dead_letter.arn
}
