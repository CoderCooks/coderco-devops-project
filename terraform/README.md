#ReadMe File for showcasing documentation around terraform workflow
# 🌱 Terraform Workflow

This project uses [Terraform] to manage AWS infrastructure as code.

---

## 🚀 Getting Started

### 1. Initialize Terraform

```bash
terraform init


## ✅ What is `terraform init`?

`terraform init` is used to:

1. **Download provider plugins** (e.g. AWS, Azure)
2. **Set up the backend** (for remote state in S3, etc.)
3. **Initialize modules** (if your config uses modules)

---

## 🧪 When to Run

- First time using a Terraform project
- After cloning a Terraform repo
- After changing provider versions or backends

---


## terraform plan

✅ What it's used for:
Preview changes before they are made

See which resources will be:

🟢 Created

🟡 Updated

🔴 Destroyed

-Double-check your changes before applying them

-Avoid surprises or mistakes in your infrastructure

💡 When to use it:
-After making any changes to your .tf files
-Before running terraform apply
---

## terraform apply

`terraform apply` is used to:

1. **Create new resources (e.g., ECS instances, S3 buckets)
2. **Update existing resources
3. **Delete resources that were removed from the code

---

## 🧪 When to Run

- After running terraform init (to set up the project)
- After running terraform plan (to preview the changes)
- When you're ready to deploy or update infrastructure
-After making changes to .tf files and reviewing them


## ✅ What is `terraform destroy`?
Use this to tear down everything managed by Terraform. Useful for:

Cleaning up after testing

Releasing unused environments

⚠️ Always double-check the plan before confirming!

