resource "aws_lambda_function" "lambda" {
  function_name = var.sns_lambda_function_name
  handler       = "index.test"
  runtime       = "python3.8"
  role          = var.lambda_role_arn

  filename = data.archive_file.lambda_zip.output_path

  source_code_hash = data.archive_file.lambda_zip.output_base64sha256
  environment {
    variables = {
      SNS_TOPIC_ARN      = aws_sns_topic.mail_topic.arn
      EMAIL_NOTIFICATION = var.sns_email_notification
    }
  }
}