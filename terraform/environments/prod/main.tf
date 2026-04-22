# Add ALB and ASG modules later

# Production Environment - Main Entry Point

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}
variable "project_name" {
  description = "Project name for tagging and resource naming"
  type        = string      
  
}
variable "docker_image" {
  description = "Docker image for the application"
  type        = string
}

module "vpc" {
  source = "../../vpc"

  project_name = var.project_name
  vpc_cidr     = var.vpc_cidr
}
module "iam" {
  source = "../../iam"
  project_name = var.project_name
}

# ← Add this output so asg can use it
output "iam_instance_profile_name" {
  value = module.iam.iam_instance_profile_name
}



module "alb" {
  source = "../../alb"

  project_name   = var.project_name
  vpc_id         = module.vpc.vpc_id
  public_subnets = module.vpc.public_subnets
}

module "asg" {
  source = "../../asg"

  project_name           = var.project_name
  vpc_id                 = module.vpc.vpc_id
  private_subnets        = module.vpc.private_subnets
  alb_sg_id              = module.alb.alb_sg_id
  target_group_arn       = module.alb.target_group_arn
  docker_image           = var.docker_image
}
output "alb_dns_name" {
  value = module.alb.alb_dns_name
}

output "application_url" {
  value = "http://${module.alb.alb_dns_name}"
}