output "sns_topic_arn" {
  description = "The SNS topic ARN"
  value       = module.sns.sns_topic_arn
}

output "test" {
  description = "The EC2 instance public IP"
  value       = {
    for instance, value in var.instances : instance => value
  }
}
