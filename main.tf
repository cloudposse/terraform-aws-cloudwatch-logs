data "aws_region" "default" {
  current = "true"
}

module "log_group_label" {
  source     = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.2.2"
  namespace  = "${var.namespace}"
  name       = "${var.name}"
  stage      = "${var.stage}"
  delimiter  = "${var.delimiter}"
  attributes = "${compact(concat(var.attributes, list("log")))}"
  tags       = "${var.tags}"
}

module "stream_label" {
  source     = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.2.2"
  namespace  = "${var.namespace}"
  name       = "${var.name}"
  stage      = "${var.stage}"
  delimiter  = "${var.delimiter}"
  attributes = "${compact(concat(var.attributes, list("stream")))}"
  tags       = "${var.tags}"
}

resource "aws_cloudwatch_log_group" "default" {
  name              = "${module.log_group_label.id}"
  retention_in_days = "${var.retention_in_days}"
  tags              = "${module.log_group_label.tags}"
}

resource "aws_cloudwatch_log_stream" "default" {
  count          = "${length(var.stream_names)}"
  name           = "${module.stream_label.id}${var.delimiter}${element(var.stream_names, count.index)}"
  log_group_name = "${aws_cloudwatch_log_group.default.name}"
}
