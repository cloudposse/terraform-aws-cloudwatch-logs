output "log_group_arn" {
  value       = module.cloudwatch_log.log_group_arn
  description = "ARN of the log group"
}

output "stream_arns" {
  value       = module.cloudwatch_log.stream_arns
  description = "ARN of the log stream"
}

output "log_group_name" {
  value       = module.cloudwatch_log.log_group_name
  description = "Name of log group"
}

output "role_arn" {
  value       = module.cloudwatch_log.role_arn
  description = "ARN of role to assume"
}

output "role_name" {
  value       = module.cloudwatch_log.role_name
  description = "Name of role to assume"
}
