output "sns_topic_arn" {
  description = "The SNS topic ARN"
  value       = aws_sns_topic.mail_topic.arn
}