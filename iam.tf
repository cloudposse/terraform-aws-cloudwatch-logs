locals {
  iam_role_enabled = local.enabled && var.iam_role_enabled
}

module "role" {
  source  = "cloudposse/iam-role/aws"
  version = "0.19.0"

  enabled = local.iam_role_enabled

  attributes = compact(concat(module.this.attributes, ["log", "group"]))

  role_description   = "Cloudwatch ${module.this.id} logs role"
  policy_description = "Cloudwatch ${module.this.id} logs policy"

  principals = var.principals

  policy_documents = [
    join("", data.aws_iam_policy_document.log_agent.*.json),
  ]

  permissions_boundary = var.permissions_boundary
  tags_enabled         = var.iam_tags_enabled


  context = module.this.context
}

data "aws_iam_policy_document" "log_agent" {
  count = local.iam_role_enabled ? 1 : 0

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
      "${join("", aws_cloudwatch_log_group.default[*].arn)}:*",
    ]
  }

  statement {
    actions = var.additional_permissions

    resources = [
      "${join("", aws_cloudwatch_log_group.default[*].arn)}:*",
    ]
  }
}
