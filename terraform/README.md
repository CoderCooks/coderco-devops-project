## 🛠️ Terraform Infrastructure Setup & Workflow

This project uses [Terraform](https://www.terraform.io/) to provision and manage AWS infrastructure as code, using modular configurations and remote state for collaboration and consistency.

---

### 📁 Project Structure

```
terraform/
├── main.tf                  # Entry point: references modules and providers
├── terraform.tfvars         # Project-specific variables
├── backend.tf               # Remote backend configuration (e.g., S3 + DynamoDB)
├── variables.tf             # Storing Variables
├── backend.tf               # Defines useful outputs attributes to be displayed when the resources are created
├── modules/                 # Reusable infrastructure modules (alb, ecs, route53, etc.)
```

---

### 🌐 Remote Backend & State Management

The project uses an S3 bucket to store the Terraform state file remotely and a DynamoDB table to enable state locking. This ensures:

- Safe, collaborative workflows
- Consistent infrastructure changes across environments
- Protection against simultaneous applies

Backend is configured via `backend.tf`, typically like:

```hcl
terraform {
  backend "s3" {
    bucket         = "your-terraform-state-bucket"
    key            = "env/project/terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "terraform-locks"
  }
}
```

---

### 🚀 Common Terraform Commands

#### ✅ `terraform init`

Initialises the Terraform working directory.

**It will:**

- Download required providers (e.g., AWS)
- Set up the remote backend (S3)
- Initialise any modules

**Run this:**

- The first time you start the project
- After cloning the repo
- After modifying backend or provider versions

```bash
terraform init
```

---

#### 🧪 `terraform plan`

Generates an execution plan and shows which resources will be:

- 🟢 Created
- 🟡 Updated
- 🔴 Destroyed

**Why use it:**

- To preview infrastructure changes
- To double-check before applying
- To avoid unintended consequences

```bash
terraform plan -var-file="terraform.tfvars"
```

---

#### ⚙️ `terraform apply`

Applies the planned changes to provision or update resources in AWS.

**It will:**

- Create new infrastructure
- Modify existing resources
- Remove anything deleted from code

```bash
terraform apply -var-file="terraform.tfvars"
```

---

#### 🧹 `terraform destroy`

Destroys everything Terraform manages.

**Use it for:**

- Cleaning up test environments
- Tearing down unused infrastructure

**⚠️ Warning:** Always double-check the plan before confirming.

```bash
terraform destroy -var-file="terraform.tfvars"
```

---

### 🧠 Troubleshooting & Gotchas

| Issue                             | Solution                                                                  |
| --------------------------------- | ------------------------------------------------------------------------- |
| `Error acquiring state lock`      | Another user/process is applying; wait or manually clear lock in DynamoDB |
| Changes not reflected             | Run `terraform refresh` to sync state                                     |
| Backend errors                    | Check credentials, S3 bucket policy, and region config                    |
| Plan shows everything to recreate | Make sure remote state was correctly initialised (`terraform init`)       |

---

### 📌 Best Practices Followed

- Remote state stored in S3
- State locking with DynamoDB
- Modular design with reusable components
- CI/CD workflows handle `plan` and `apply` securely

---
