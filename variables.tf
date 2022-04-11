variable "kms_key_arn" {
  description = <<-EOT
  The ARN of the KMS Key to use when encrypting log data.

  Please note, after the AWS KMS CMK is disassociated from the log group, AWS CloudWatch Logs stops encrypting newly ingested data for the log group.

  All previously ingested data remains encrypted, and AWS CloudWatch Logs requires permissions for the CMK whenever the encrypted data is requested.
  EOT
  default     = ""
}

variable "retention_in_days" {
  description = "Number of days you want to retain log events in the log group"
  default     = "30"
}

variable "stream_names" {
  default     = []
  type        = list(string)
  description = "Names of streams"
}

variable "iam_role_enabled" {
  type        = bool
  description = "Whether to create an IAM role which is able to write logs to the CloudWatch Logs log group"
  default     = true
}

variable "principals" {
  type        = map(any)
  description = "Map of service name as key and a list of ARNs to allow assuming the role as value. (e.g. map(`AWS`, list(`arn:aws:iam:::role/admin`)))"

  default = {
    Service = ["ec2.amazonaws.com"]
  }
}

variable "additional_permissions" {
  default = [
    "logs:CreateLogStream",
    "logs:DeleteLogStream",
  ]

  type        = list(string)
  description = "Additional permissions granted to the IAM role"
}

variable "permissions_boundary" {
  type        = string
  default     = ""
  description = "ARN of the policy that is used to set the permissions boundary for the IAM role"
}

variable "iam_tags_enabled" {
  type        = string
  description = "Enable/disable tags on IAM roles and policies"
  default     = true
}
