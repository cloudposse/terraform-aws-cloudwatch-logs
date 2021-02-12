variable "region" {
  type = string
}

variable "retention_in_days" {
  description = "Number of days you want to retain log events in the log group"
  default     = "30"
}

variable "stream_names" {
  type        = list(string)
  description = "Names of streams"
  default     = []
}
