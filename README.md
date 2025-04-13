# 🌐 CoderCooks AWS Infrastructure

A production-ready cloud infrastructure setup that deploys a Node.js web application to AWS using ECS Fargate, ECR, ACM, ALB, Route 53, and Terraform — all managed through GitHub Actions CI/CD.

---

## 🚀 Overview

This project provisions the entire infrastructure stack for a scalable, containerized application hosted on AWS, and provides seamless domain routing with HTTPS using an ACM certificate. It leverages GitHub Actions workflows for infrastructure deployment automation.

---

## 📦 Project Structure

```
├── terraform/                  # Main Terraform configuration
 ├── modules/                   # Modular Terraform components (alb, ecs, route53, etc.)
├── .github/workflows/          # GitHub Actions CI/CD pipelines (ci, plan, apply and destroy)
├── coderco-app/                # Application Code, Dockerfile and supporting container files
├── public/architecture.png     # Architectural diagram (included below)
├── README.md                   # This file
```

---

## 🧱 Infrastructure Components

| Component          | Description                                        |
| ------------------ | -------------------------------------------------- |
| **ECS Fargate**    | Container orchestration with serverless deployment |
| **ECR**            | Docker image repository                            |
| **ALB + ACM**      | HTTPS load balancing and certificate management    |
| **Route 53**       | Domain routing and DNS management                  |
| **Terraform**      | Infrastructure as Code (IaC)                       |
| **GitHub Actions** | CI/CD automation for plan and apply workflows      |

---

## 🛠️ Prerequisites

- AWS CLI configured (`aws configure`)
- Terraform ≥ 1.3
- Docker
- Node.js (if running app locally)

---

## ⚙️ Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/your-org/your-repo.git
cd your-repo
```

### 2. Configure Terraform variables

Create `terraform/terraform.tfvars`:

```hcl
domain_name       = "domain.com"
ecr_repo_name     = "myecrrepo"
subnet_ids        = ["subnet-abc", "subnet-def"]
...
```

### 3. Deploy Infrastructure

```bash
cd terraform
terraform init
terraform plan -var-file="terraform.tfvars"
terraform apply -var-file="terraform.tfvars"
```

---

## 📸 Architectural Diagram

![Architectural Diagram](public/architecture.png)

> This diagram outlines the high-level infrastructure on AWS: ECS Fargate handles compute, the ALB manages routing and HTTPS, and Route 53 maps the domain `www.tm-yahya.com` to the app.

---

## 🎯 Best Practices Implemented

- ✅ **Remote state management** with S3 + DynamoDB locking
- ✅ **ACM with HTTPS enforcement**
- ✅ **Modular Terraform** for maintainability
- ✅ **Multi-stage Docker builds**
- ✅ **Secure networking** with public/private subnets
- ✅ **CI/CD with GitHub Actions**
- ✅ **Terraform linting (TFLint)** and formatting checks
- ✅ **Environment-specific variable management**

---

## 🌐 Live Demo

- 🔗 **URL:** [`https://www.tm-yahya.com`](https://www.tm-yahya.com)
- ✅ Served over HTTPS with valid ACM certificate
- ⚡ Backed by scalable ECS Fargate infrastructure

---

## 🎥 Application Showcase

![Application Demo](public/demo.gif)

> This animated demo shows the deployed web app running in production.

---

## 📌 Future Improvements

- 📊 Integrate CloudWatch dashboards or Datadog for monitoring
- 🔁 Introduce staging/prod pipeline split
- 🚦 Implement blue/green deployments

---

## 🧑‍💻 Author

**Yahya** — DevOps Engineer
