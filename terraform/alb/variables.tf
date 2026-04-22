variable "project_name" {
  type        = string
  description = "Project name used for resource naming"
  validation {
    condition     = can(regex("^[a-zA-Z0-9-]+$", var.project_name))
    error_message = "project_name must contain only alphanumeric characters and hyphens."
  }
}

variable "vpc_id" {}
variable "public_subnets" { type = list(string) }