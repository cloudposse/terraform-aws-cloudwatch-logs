variable "region" {
  type        = string
  description = "AWS region"
}

variable "stream_names" {
  type        = list(string)
  description = "Names of streams"
  default     = []
}
