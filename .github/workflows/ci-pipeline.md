# 🚀 CI/CD Pipeline Overview

This document explains how CI/CD is configured for the project using GitHub Actions, Terraform, and AWS. The pipeline automates infrastructure provisioning and application deployment.

---

## 📁 Workflow Files

- **ci.yml** – Builds and pushes Docker images to ECR.
- **plan.yml** – Runs `terraform plan` to preview infrastructure changes.
- **apply.yml** – Applies the Terraform plan to deploy resources.
- **destroy.yml** – Destroys the provisioned infrastructure.

---

## ⚙️ Workflow Structure

### 🐳 CI Workflow (`ci.yml`)
- **Trigger:** Manual (`workflow_dispatch`)
- **Steps:**
  - Builds Docker image for the app.
  - Logs in to Amazon ECR.
  - Pushes the image to ECR.

### 🌍 Terraform Plan (`plan.yml`)
- **Trigger:** Manual
- **Steps:**
  - Initializes Terraform.
  - Formats and validates configs.
  - Executes `terraform plan`.

### 🚀 Terraform Apply (`apply.yml`)
- **Trigger:** Manual
- **Steps:**
  - Applies the Terraform plan to deploy infrastructure.

### 🔥 Terraform Destroy (`destroy.yml`)
- **Trigger:** Manual
- **Steps:**
  - Runs `terraform destroy` to tear down infrastructure.

---

## 🔐 Secrets Usage

The workflows securely use secrets configured in GitHub:
- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`

These are used to authenticate with AWS and manage infrastructure via Terraform or Docker deployments.

## ⚡️ Triggering & Debugging Workflows

### 🔄 Manual Triggers

Each workflow uses `workflow_dispatch`, meaning they must be run manually from the GitHub Actions tab:

1. Go to your repository on GitHub.
2. Click on the **Actions** tab.
3. Select the workflow (e.g., `Terraform Plan`, `CI Workflow`, etc.).
4. Click **Run workflow**, choose a branch if needed, then hit **Run**.

### 🛠 Debugging Tips

- Use `terraform plan` before `apply` to avoid unexpected infrastructure changes.
- Add `echo` statements or use `set -x` in bash steps to see command-level logs.
- Check the “Logs” tab of each GitHub Actions job step for detailed output.
- Validate secrets are correctly configured in GitHub Settings → Secrets and Variables → Actions.

---

## 🚀 Deployment Types

| Workflow       | Manual | Automatic |
|----------------|--------|-----------|
| `ci.yml`       | ✅      | ❌         |
| `plan.yml`     | ✅      | ❌         |
| `apply.yml`    | ✅      | ❌         |
| `destroy.yml`  | ✅      | ❌         |

You can convert these into automatic triggers later (e.g., on `push` to `main`) if needed for continuous deployment.
