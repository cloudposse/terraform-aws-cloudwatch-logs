output "log_group_arn" {
  value       = "${aws_cloudwatch_log_group.default.arn}"
  description = "ARN of the log group"
}

output "stream_arn" {
  value       = "${aws_cloudwatch_log_stream.default.*.arn}"
  description = "ARN ofthe log stream"
}
