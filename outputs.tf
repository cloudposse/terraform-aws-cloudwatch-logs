output "log_group_arn" {
  value       = "${aws_cloudwatch_log_group.default.arn}"
  description = "ARN of the log group"
}

output "stream_arns" {
  value       = "${aws_cloudwatch_log_stream.default.*.arn}"
  description = "ARN of the log stream"
}

output "policy_arn" {
  value       = "${aws_iam_policy.log_agent.arn}"
  description = "ARN of the log agent policy"
}

output "log_group_name" {
  description = "Name of log group"
  value       = "${aws_cloudwatch_log_group.default.name}"
}

output "log_stream_names" {
  description = "Name of log streams"
  value       = ["${aws_cloudwatch_log_stream.default.*.name}"]
}
