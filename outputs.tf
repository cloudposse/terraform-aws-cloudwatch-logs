output "log_group_arn" {
  value       = "${aws_cloudwatch_log_group.default.arn}"
  description = "ARN of the log group"
}

output "stream_arn" {
  value       = "${aws_cloudwatch_log_stream.default.*.arn}"
  description = "ARN ofthe log stream"
}

output "user_name" {
  value       = "${aws_iam_user.default.name}"
  description = "AWS username"
}

output "user_arn" {
  value       = "${aws_iam_user.default.arn}"
  description = "ARN of AWS user"
}

output "user_id" {
  value       = "${aws_iam_user.default.unique_id}"
  description = "ID of user"
}

output "access_key_id" {
  value       = "${aws_iam_access_key.default.}"
  description = "Access key ID"
}

output "access_key_secret" {
  value       = "${aws_iam_access_key.default.secret}"
  description = "Secret access key"
}

output "access_key_status" {
  value       = "${aws_iam_access_key.default.status}"
  description = "Access key status"
}
