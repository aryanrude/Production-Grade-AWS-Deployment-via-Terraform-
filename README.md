# Production-Grade AWS Deployment of React + Spring Boot E-Commerce App

**End-to-End DevOps Project** | Terraform IaC | Jenkins CI/CD | Docker | Kubernetes-ready | AWS

Fully automated deployment of a full-stack e-commerce application on production-grade AWS infrastructure with zero-downtime and auto-scaling.

![Architecture Diagram](screenshots/architecture-diagram.png)

## Tech Stack
- **Frontend**: React.js
- **Backend**: Spring Boot (Java) + REST APIs + MySQL
- **Infrastructure**: AWS (VPC, ALB, Auto Scaling Group, IAM, RDS, CloudWatch)
- **IaC**: Terraform
- **CI/CD**: Jenkins Pipeline + GitHub Actions (ready)
- **Containerization**: Docker
- **Monitoring**: AWS CloudWatch Alarms + Auto Scaling

## Key Achievements
- Reduced deployment time by **40%** through fully automated Jenkins CI/CD pipeline
- Achieved **20% infrastructure cost reduction** using Auto Scaling Groups and proper CloudWatch metrics
- Implemented zero-downtime deployment strategy with Application Load Balancer
- Production-grade security (IAM least privilege, private subnets, secure RDS)

## Project Structure

```bash
├── terraform/          # Infrastructure as Code
├── jenkins/Jenkinsfile # CI/CD Pipeline
├── application/        # React + Spring Boot source
└── docker/             # Docker configuration
