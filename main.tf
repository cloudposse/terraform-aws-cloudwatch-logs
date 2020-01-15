module "label" {
  source     = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.3.3"
  namespace  = var.namespace
  name       = var.name
  stage      = var.stage
  delimiter  = var.delimiter
  attributes = compact(concat(var.attributes, ["log"], ["group"]))
  tags       = var.tags
  enabled    = var.enabled
}

resource "aws_cloudwatch_log_group" "default" {
  count             = var.enabled == "true" ? 1 : 0
  name              = module.label.id
  retention_in_days = var.retention_in_days
  tags              = module.label.tags
  kms_key_id        = var.kms_key_arn
}

resource "aws_cloudwatch_log_stream" "default" {
  count          = var.enabled == "true" && length(var.stream_names) > 0 ? length(var.stream_names) : 0
  name           = element(var.stream_names, count.index)
  log_group_name = element(aws_cloudwatch_log_group.default.*.name, 0)
}

