variable "aws_region" {
  description = "AWS Region"
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name for tagging"
  default     = "ecommerce-devops"
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  default     = "10.0.0.0/16"
}

variable "docker_image" {
  description = "Docker image to deploy"
  default     = "aryanrude/ecommerce-app:latest"
}