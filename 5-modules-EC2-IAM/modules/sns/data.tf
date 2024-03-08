data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "sns_topic_policy" {
  statement {
    actions = [
      "SNS:Subscribe",
      "SNS:SetTopicAttributes",
      "SNS:RemovePermission",
      "SNS:Receive",
      "SNS:Publish",
      "SNS:ListSubscriptionsByTopic",
      "SNS:GetTopicAttributes",
      "SNS:DeleteTopic",
      "SNS:AddPermission",
    ]
    condition {
      test     = "StringEquals"
      variable = "aws:SourceOwner"
      values   = [data.aws_caller_identity.current.account_id]
    }
    effect = "Allow"
    principals {
      type        = "*"
      identifiers = ["*"]
    }
    resources = [aws_sns_topic.mail_topic.arn]
  }
}

data "archive_file" "lambda_zip" {
  type        = "zip"
  source_dir  = "${path.module}/lambda"
  output_path = "${path.module}/lambda/lambda.zip"
}