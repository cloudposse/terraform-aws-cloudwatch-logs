data "aws_iam_policy_document" "log_assume" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["logs.${length(var.region) > 0 ? var.region: data.aws_region.default.name}.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "log" {
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
      "${aws_cloudwatch_log_group.default.arn}",
      "${join(",", aws_cloudwatch_log_stream.default.*.arn)}",
    ]
  }
}

resource "aws_iam_role" "log" {
  name               = "${module.log_group_label.id}"
  assume_role_policy = "${data.aws_iam_policy_document.log_assume.json}"
}

resource "aws_iam_role_policy" "log" {
  name   = "${module.log_group_label.id}"
  role   = "${aws_iam_role.log.id}"
  policy = "${data.aws_iam_policy_document.log.json}"
}
