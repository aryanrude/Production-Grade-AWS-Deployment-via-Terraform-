# Production-Grade AWS Deployment of React + Spring Boot Application

**DevOps Project** | **Terraform | AWS | Jenkins | Docker | React | Spring Boot**

End-to-end CI/CD pipeline that automates the deployment of a full-stack web application on highly available AWS infrastructure.

## Architecture Overview

- **Frontend**: React.js
- **Backend**: Spring Boot (Java)
- **Infrastructure**: VPC (public/private subnets), ALB, Auto Scaling Group, IAM roles
- **CI/CD**: Jenkins Pipeline
- **Containerization**: Docker
- **Monitoring**: CloudWatch Alarms + Auto Scaling



## Features

- Modular Terraform infrastructure as code
- Secure IAM configuration
- Automated build, test, Docker build & push
- Zero-downtime deployment via ALB + ASG
- Auto scaling based on traffic (CloudWatch)
- Production-grade security best practices

## Project Structure

```bash
├── terraform/          # Infrastructure as Code
├── jenkins/Jenkinsfile # CI/CD Pipeline
├── application/        # React + Spring Boot source (optional)
└── docker/             # Docker configuration
