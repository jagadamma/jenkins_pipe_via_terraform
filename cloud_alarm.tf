resource "aws_cloudwatch_metric_alarm" "cpu_utilization_alarm" {
  alarm_name          = "CPUUtilization"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "300"
  statistic           = "Average"
  threshold           = "10"

  alarm_description = "Alarm triggered when CPU utilization exceeds 80%"

  dimensions = {
    InstanceId = aws_instance.my.id
  }
