# Terraform AWS EC2 + IAM + S3 Remote Backend Setup

This project demonstrates how to provision an AWS EC2 instance, create and attach an IAM role, store the Terraform state file in an S3 bucket, and manage everything via Terraform.

## 🗂️ File Structure

```
.
├── main.tf              # Main infrastructure resources (EC2, S3, IAM Role)
├── variables.tf         # Input variables for the project
├── terraform.tfvars     # Actual values assigned to variables
├── outputs.tf           # Outputs after successful apply
├── backend.tf           # Remote backend config (S3 for state storage)
```

## ✅ Steps Performed

### 1. **Created an S3 Bucket**
- Stores Terraform state files remotely.
- Versioning enabled to retain state history.
- Encrypted and private.

### 2. **Created an IAM Role**
- Role: `EC2TerraformRole`
- Trusted by EC2 (via `assume_role_policy`).
- Attached a policy that grants full access to S3.

### 3. **Created an Instance Profile**
- Wraps the IAM role to be attached to EC2.

### 4. **Launched an EC2 Instance**
- Instance type and AMI provided via variables.
- IAM instance profile is attached.
- Simple name tag added.

### 5. **Configured Remote Backend (S3)**
- Stores `.tfstate` in `manage-tf-state-bucket-06082025`
- Path: `env/dev/terraform.tfstate`
- Backend config is in `backend.tf`

## 🧩 Commands to Run

```bash
# 1. Initialize Terraform (configure backend)
terraform init

# 2. Plan infrastructure
terraform plan

# 3. Apply and create AWS resources
terraform apply

# 4. Destroy all resources when done
terraform destroy
```

## 🧠 Notes
- If you're using a remote backend, state will not be saved locally.
- Ensure your AWS credentials are configured (`~/.aws/credentials` or env vars).

## 👤 Author
**Manish Singh**
Created for learning and hands-on practice with AWS + Terraform.

---
Happy Learning!
