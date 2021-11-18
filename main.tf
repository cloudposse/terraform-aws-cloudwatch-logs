locals {
  enabled = module.this.enabled
}

module "log_group_label" {
  source  = "cloudposse/label/null"
  version = "0.25.0"

  # Allow forward slashes
  regex_replace_chars = "/[^a-zA-Z0-9-\\/]/"

  context = module.this.context
}

resource "aws_cloudwatch_log_group" "default" {
  count             = local.enabled ? 1 : 0
  name              = module.log_group_label.id
  retention_in_days = var.retention_in_days
  tags              = module.log_group_label.tags
  kms_key_id        = var.kms_key_arn
}

resource "aws_cloudwatch_log_stream" "default" {
  count          = local.enabled && length(var.stream_names) > 0 ? length(var.stream_names) : 0
  name           = element(var.stream_names, count.index)
  log_group_name = element(aws_cloudwatch_log_group.default.*.name, 0)
}
