output "log_group_arn" {
  value       = "${aws_cloudwatch_log_group.default.arn}"
  description = "ARN of the log group"
}

output "stream_arns" {
  value       = "${aws_cloudwatch_log_stream.default.*.arn}"
  description = "ARN of the log stream"
}

output "log_group_name" {
  description = "Name of log group"
  value       = "${aws_cloudwatch_log_group.default.name}"
}

output "assumed_role_arn" {
  value       = "${aws_iam_role.default.arn}"
  description = "ARN of role to assume"
}

output "assumed_role_name" {
  value       = "${aws_iam_role.default.name}"
  description = "Name of role to assume"
}

output "policy_arn" {
  value       = "${aws_iam_policy.default.arn}"
  description = "ARN of role to assume"
}

output "policy_name" {
  value       = "${aws_iam_policy.default.name}"
  description = "Name of role to assume"
}
