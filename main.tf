module "label" {
  source     = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.3.3"
  namespace  = "${var.namespace}"
  name       = "${var.name}"
  stage      = "${var.stage}"
  delimiter  = "${var.delimiter}"
  attributes = "${compact(concat(var.attributes, list("log"), list("group")))}"
  tags       = "${var.tags}"
}

module "stream_label" {
  source     = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.3.3"
  namespace  = "${var.namespace}"
  name       = "${var.name}"
  stage      = "${var.stage}"
  delimiter  = "${var.delimiter}"
  attributes = "${compact(concat(var.attributes, list("stream")))}"
  tags       = "${var.tags}"
}

resource "aws_cloudwatch_log_group" "default" {
  name              = "${module.label.id}"
  retention_in_days = "${var.retention_in_days}"
  tags              = "${module.label.tags}"
}

resource "aws_cloudwatch_log_stream" "default" {
  count          = "${length(var.stream_names)}"
  name           = "${module.stream_label.id}${var.delimiter}${element(var.stream_names, count.index)}"
  log_group_name = "${aws_cloudwatch_log_group.default.name}"
}


data "aws_iam_policy_document" "log_agent" {
  statement {
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "logs:DescribeLogGroups",
      "logs:DescribeLogStreams",
      "logs:CreateLogStream",
      "logs:DeleteLogStream",
    ]

    resources = [
      "${join(",", compact(concat(list(aws_cloudwatch_log_group.default.arn), aws_cloudwatch_log_stream.default.*.arn)))}",
    ]
  }
}

module "label_agent" {
  source     = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.3.3"
  namespace  = "${var.namespace}"
  name       = "${var.name}"
  stage      = "${var.stage}"
  delimiter  = "${var.delimiter}"
  attributes = "${compact(concat(var.attributes, list("log"), list("group"), list("agent")))}"
  tags       = "${var.tags}"
}

resource "aws_iam_policy" "log_agent" {
  name   = "${module.label_agent.id}"
  policy = "${data.aws_iam_policy_document.log_agent.json}"
}
