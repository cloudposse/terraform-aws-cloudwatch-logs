# terraform-aws-cloudwatch-logs [![Build Status](https://travis-ci.org/cloudposse/terraform-aws-cloudwatch-logs.svg?branch=master)](https://travis-ci.org/cloudposse/terraform-aws-cloudwatch-logs)

Terraform module for creation streams and group for them.

## Usage

```terraform
module "cloudwatch_log" {
  namespace    = "${var.namespace}"
  stage        = "${var.stage}"
  stream_names = ["kafka-instance-1", "kafka-instance-2"]
}
```

## Inputs

| Name                |    Default    | Description                                                     | Required |
|:--------------------|:-------------:|:----------------------------------------------------------------|:--------:|
| `namespace`         |      ``       | Namespace (e.g. `cp` or `cloudposse`)                           |   Yes    |
| `stage`             |      ``       | Stage (e.g. `prod`, `dev`, `staging`)                           |   Yes    |
| `name`              |      ``       | Name  (e.g. `bastion` or `db`)                                  |    No    |
| `delimiter`         |      `-`      | Delimiter to be used between `name`, `namespace`, `stage`, etc. |    No    |
| `attributes`        |     `[]`      | Additional attributes (e.g. `policy` or `role`)                 |    No    |
| `tags`              |     `{}`      | Additional tags  (e.g. `map("BusinessUnit","XYZ")`              |    No    |
| `retention_in_days` |     `30`      | Number of days you want to retain log events in the log group   |    No    |
| `stream_names`      | `["default"]` | List names of streams                                           |    No    |
| `user_enabled`      |    `true`     | Flag for creation user                                          |    No    |
| `region`            |      ``       | AWS region, by default used the region of caller                |    No    |

## Outputs

| Name                | Description           |
|:--------------------|:----------------------|
| `log_group_arn`     | ARN of the log group  |
| `access_key_id`     | Access key ID         |
| `secret_access_key` | Secret access key     |
| `stream_arns`       | ARN of the log stream |
| `user_arn`          | ARN of AWS user       |
| `user_name`         | AWS username          |
| `user_unique_id`    | ID of user            |
| `log_stream_names`  | Name of log streams   |
| `log_group_name`    | Name of log group     |

## License

Apache 2 License. See [`LICENSE`](LICENSE) for full details.
