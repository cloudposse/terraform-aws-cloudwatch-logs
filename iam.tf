module "role" {
  source  = "cloudposse/iam-role/aws"
  version = "0.9.3"

  attributes = compact(concat(module.this.attributes, ["log"], ["group"]))

  role_description   = "Cloudwatch ${module.this.id} logs role"
  policy_description = "Cloudwatch ${module.this.id} logs policy"

  principals = var.principals

  policy_documents = [
    data.aws_iam_policy_document.log_agent.json,
  ]

  context = module.this.context
}

data "aws_iam_policy_document" "log_agent" {
  statement {
    actions = [
      "logs:DescribeLogGroups",
      "logs:DescribeLogStreams",
    ]

    resources = ["*"]
  }

  statement {
    actions = [
      "logs:PutLogEvents",
    ]

    resources = [
      join("", aws_cloudwatch_log_group.default.*.arn),
    ]
  }

  statement {
    actions = var.additional_permissions

    resources = [
      join("", aws_cloudwatch_log_group.default.*.arn),
    ]
  }
}
