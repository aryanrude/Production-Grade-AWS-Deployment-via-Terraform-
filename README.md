# Production-Grade AWS Deployment with Terraform, Jenkins & Docker

A complete, modular, and production-ready infrastructure project that deploys a highly available containerized application on AWS using Infrastructure as Code (IaC).

![Architecture Diagram](docs/architecture-diagram.png)

## 🚀 Project Overview

This project demonstrates real-world DevOps practices by provisioning a secure, scalable, and fully automated AWS environment for a Dockerized application.

### Key Features
- **Modular Terraform Infrastructure** — VPC with public/private subnets, NAT Gateway, Internet Gateway, and multi-AZ setup
- **Application Load Balancer (ALB)** — with target groups and health checks in public subnets
- **Auto Scaling Group (ASG)** — of EC2 instances in private subnets with Launch Templates
- **Secure CI/CD Pipeline** — IAM role-based Jenkins server that automates Docker build → push → deploy
- **Dynamic Autoscaling** — CloudWatch Alarms and scaling policies for handling traffic spikes
- **Security Best Practices** — Least privilege IAM, security groups, private subnets for compute

## 🛠 Tech Stack
- **Infrastructure as Code**: Terraform (modular design)
- **CI/CD**: Jenkins (with Pipeline as Code)
- **Containerization**: Docker
- **AWS Services**: VPC, EC2, ALB, ASG, IAM, CloudWatch, ECR (optional)
- **Others**: Git, Bash scripting

## 📊 Architecture Diagram

(Insert a clean diagram here — use draw.io / Lucidchart / Excalidraw)

High-level flow:
Internet → ALB (Public) → Target Group → ASG (Private Subnets) → Docker Containers

## 🏗 How It Works

1. Terraform provisions the entire infrastructure (VPC → ALB → ASG + IAM roles)
2. Jenkins pipeline (triggered on code push) builds the Docker image and deploys it to the ASG using rolling updates or blue/green strategy
3. CloudWatch monitors CPU/Memory and automatically scales the ASG up/down

## 📋 Features Implemented
- Multi-AZ high availability
- Private subnets for application servers (security by design)
- IAM roles with least privilege for Jenkins and EC2
- CloudWatch alarms for CPU-based autoscaling
- Modular Terraform code (reusable modules)

## 🚀 Getting Started

### Prerequisites
- AWS Account with proper permissions
- Terraform 1.x installed
- Docker installed
- Git

### Deployment Steps
```bash
# 1. Clone the repo
git clone https://github.com/yourusername/production-aws-deployment-terraform.git

# 2. Configure variables
cp terraform/terraform.tfvars.example terraform/terraform.tfvars

# 3. Initialize and deploy infrastructure
cd terraform
terraform init
terraform plan
terraform apply -auto-approve
