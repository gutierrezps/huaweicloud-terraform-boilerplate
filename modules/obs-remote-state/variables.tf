variable "region" {
  type        = string
  description = "Region where OBS bucket will be deployed"
}

variable "bucket_name" {
  type        = string
  description = "OBS bucket name where state file will be stored"
}

variable "iam_username" {
  type        = string
  default     = null
  description = <<-EOT
    Username for IAM User who will have read-write permissions to the OBS
    bucket. If not specified, the IAM Username will be the same as bucket_name
  EOT
}

variable "enterprise_project_id" {
  type        = string
  default     = "0"
  description = <<-EOT
    Enterprise Project where OBS bucket will be created. If not specified,
    will use the default Enterprise Project.
  EOT
}
