## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| additional_permissions | Additional permissions granted to assumed role | list | `<list>` | no |
| attributes | Additional attributes (e.g. `policy` or `role`) | list | `<list>` | no |
| delimiter | Delimiter to be used between `name`, `namespace`, `stage`, etc. | string | `-` | no |
| enabled | If true, deploy the resources for the module | string | `true` | no |
| name | Name  (e.g. `bastion` or `db`) | string | `` | no |
| namespace | Namespace (e.g. `cp` or `cloudposse`) | string | - | yes |
| principals | Map of service name as key and a list of ARNs to allow assuming the role as value. (e.g. map(`AWS`, list(`arn:aws:iam:::role/admin`))) | map | `<map>` | no |
| retention_in_days | Number of days you want to retain log events in the log group | string | `30` | no |
| stage | Stage (e.g. `prod`, `dev`, `staging`) | string | - | yes |
| stream_names | Names of streams | list | `<list>` | no |
| tags | Additional tags (e.g. map(`BusinessUnit`,`XYZ`) | map | `<map>` | no |

## Outputs

| Name | Description |
|------|-------------|
| assumed_role_arn | ARN of role to assume |
| assumed_role_name | Name of role to assume |
| log_group_arn | ARN of the log group |
| log_group_name | Name of log group |
| stream_arns | ARN of the log stream |

