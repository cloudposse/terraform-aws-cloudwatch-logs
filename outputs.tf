output "log_group_arn" {
  value       = join("", aws_cloudwatch_log_group.default.*.arn)
  description = "ARN of the log group"
}

output "stream_arns" {
  value       = aws_cloudwatch_log_stream.default.*.arn
  description = "ARNs of the log streams"
}

output "log_group_name" {
  description = "Name of log group"
  value       = join("", aws_cloudwatch_log_group.default.*.name)
}

output "role_arn" {
  value       = module.role.arn
  description = "ARN of the IAM role"
}

output "role_name" {
  value       = module.role.name
  description = "Name of the IAM role"
}
