resource "aws_cloudwatch_log_group" "default" {
  count             = module.this.enabled ? 1 : 0
  name              = module.this.id
  retention_in_days = var.retention_in_days
  tags              = module.this.tags
  kms_key_id        = var.kms_key_arn
}

resource "aws_cloudwatch_log_stream" "default" {
  count          = module.this.enabled && length(var.stream_names) > 0 ? length(var.stream_names) : 0
  name           = element(var.stream_names, count.index)
  log_group_name = element(aws_cloudwatch_log_group.default.*.name, 0)
}
