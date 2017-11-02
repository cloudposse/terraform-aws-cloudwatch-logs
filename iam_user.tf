resource "aws_iam_user" "default" {
  count         = "${var.username != "" ? 1 : 0}"
  name          = "${var.username}"
  path          = "${var.path}"
  force_destroy = "${var.force_destroy }"
}

resource "aws_iam_access_key" "default" {
  count = "${var.username != "" ? 1 : 0}"
  user  = "${aws_iam_user.default.name}"
}

resource "aws_iam_user_policy" "default" {
  count  = "${var.username != "" ? 1 : 0}"
  name   = "${var.username}"
  user   = "${aws_iam_user.default.name}"
  policy = "${data.aws_iam_policy_document.user.json}"
}

data "aws_iam_policy_document" "user" {
  count = "${var.username != "" ? 1 : 0}"

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
