# terraform-aws-cloudwatch-logs

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

| Name                | Default | Description                                                     | Required |
|:--------------------|:-------:|:----------------------------------------------------------------|:--------:|
| `namespace`         |   ``    | Namespace (e.g. `cp` or `cloudposse`)                           |   Yes    |
| `stage`             |   ``    | Stage (e.g. `prod`, `dev`, `staging`)                           |   Yes    |
| `name`              |   ``    | Name  (e.g. `bastion` or `db`)                                  |    No    |
| `delimiter`         |   `-`   | Delimiter to be used between `name`, `namespace`, `stage`, etc. |    No    |
| `attributes`        |  `[]`   | Additional attributes (e.g. `policy` or `role`)                 |    No    |
| `tags`              |  `{}`   | Additional tags  (e.g. `map("BusinessUnit","XYZ")`              |    No    |
| `retention_in_days` |  `30`   | Number of days you want to retain log events in the log group   |    No    |
| `stream_names`      |  `[]`   | List names of streams                                           |   Yes    |


## Outputs

| Name          | Description          |
|:--------------|:---------------------|
| log_group_arn | ARN of the log group |
| stream_arn    | ARN ofthe log stream |
