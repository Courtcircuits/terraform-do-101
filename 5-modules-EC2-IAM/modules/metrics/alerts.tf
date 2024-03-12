resource "aws_cloudwatch_metric_alarm" "example" {
  alarm_name          = "EC2_RunInstances_API_Average_CallCount"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  threshold           = "${var.threshold}"
  metric_name         = "CallCount"
  namespace           = "AWS/Usage"
  period              = "30"
  statistic           = "Average"

  dimensions = {
    Service   = "EC2"
    Type      = "API"
    Resource  = "RunInstances"
  }

  alarm_description = "Alarm when average CallCount for EC2 RunInstances API is greater than or equal to 1"

  alarm_actions = [var.sns_arn]

  ok_actions = [var.sns_arn]

  insufficient_data_actions = []

}
