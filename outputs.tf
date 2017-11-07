output "log_group_arn" {
  value       = "${aws_cloudwatch_log_group.default.arn}"
  description = "ARN of the log group"
}

output "stream_arn" {
  value       = "${aws_cloudwatch_log_stream.default.*.arn}"
  description = "ARN of the log stream"
}

output "user_name" {
  description = "AWS username"
  value       = "${module.user.user_name}"
}

output "user_arn" {
  description = "ARN of AWS user"
  value       = "${module.user.user_arn}"
}

output "user_unique_id" {
  description = "ID of user"
  value       = "${module.user.user_unique_id}"
}

output "access_key_id" {
  description = "Access key ID"
  value       = "${module.user.access_key_id}"
}

output "secret_access_key" {
  description = "Secret access key"
  value       = "${module.user.secret_access_key}"
}
