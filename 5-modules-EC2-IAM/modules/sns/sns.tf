resource "aws_sns_topic" "mail_topic" {
  name = var.sns_topic_name
}

resource "aws_sns_topic_policy" "mail_topic_policy" {
  arn    = aws_sns_topic.mail_topic.arn
  policy = data.aws_iam_policy_document.sns_topic_policy.json
}

resource "aws_sns_topic_subscription" "mail_topic_subscription" {
  for_each  = toset(var.sns_email_subscribers)
  topic_arn = aws_sns_topic.mail_topic.arn
  protocol  = "email"
  endpoint  = each.value
}
