data "aws_iam_policy_document" "user" {
  statement {
    actions = [
      "logs:DescribeDestinations",
      "logs:DescribeExportTasks",
      "logs:DescribeLogGroups",
      "logs:DescribeLogStreams",
      "logs:DescribeMetricFilters",
      "logs:DescribeSubscriptionFilters",
      "logs:FilterLogEvents",
      "logs:GetLogEvents",
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "logs:DescribeLogStreams",
      "logs:CreateLogStream",
      "logs:DeleteLogStream",
    ]

    resources = ["*"]
  }
}

module "user" {
  source    = "git::https://github.com/cloudposse/terraform-aws-iam-system-user.git?ref=update-label-module"
  namespace = "${var.namespace}"
  stage     = "${var.stage}"
  name      = "${var.name}"
  policy    = "${data.aws_iam_policy_document.user.json}"
  enabled   = "${var.user_enabled}"
}
