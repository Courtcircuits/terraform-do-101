variable "sns_topic_name" {
  description = "The SNS topic name"
  type        = string
}

variable "sns_lambda_function_name" {
  description = "The SNS lambda function name"
  type        = string
}

variable "sns_email_subscribers" {
  description = "The SNS email subscribers"
  type        = list(string)
}

variable "sns_email_notification" {
  description = "The SNS email notification"
  type        = string
}

variable "lambda_role_arn" {
  description = "The lambda role arn"
  type        = string
}