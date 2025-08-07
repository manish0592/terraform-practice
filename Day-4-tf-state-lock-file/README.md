# Terraform EC2 with Remote State

## What This Does
- Launches EC2 instance
- Stores Terraform state in S3
- Uses DynamoDB for state locking

## What is Terraform State?
Terraform uses a **state file** (`terraform.tfstate`) to keep track of infrastructure resources. This file maps Terraform resources to real-world infrastructure.

## Why Use S3 for tfstate?
- Centralized storage
- Better collaboration
- Enables recovery via versioning

### ✅ Benefits of Storing State in S3
- **Remote access**: Teams can access the same state file across environments and machines.
- **Durability**: S3 provides high availability and durability.
- **Versioning**: You can enable versioning on the S3 bucket to track historical state changes.
- **Backup & Recovery**: If something breaks, you can restore a previous version of the state file.

## 🔒 Why Use Locking (DynamoDB Lock Table)?
When multiple people or processes run Terraform at the same time, **race conditions** may occur (e.g., two users updating the same resource). Locking prevents this.

### ✅ Benefits of Locking
- **Prevents simultaneous state modifications**
- **Ensures consistency and avoids corruption**
- **Supports safe team collaboration**

## ⚙️ How it Works Together
When you configure remote backend with S3 + DynamoDB lock:

```hcl
terraform {
  backend "s3" {
    bucket         = "my-tf-state-bucket"
    key            = "env/dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
```

- The state file is saved in S3.
- DynamoDB handles **locking** to prevent concurrent state updates.

## 🧠 Best Practices
- Always enable **versioning** on your S3 bucket.
- Create a dedicated **DynamoDB table** for state locking.
- Use **separate state files** for each environment (`dev`, `prod`, etc.).
- Never manually edit the `terraform.tfstate` file.

---

## 👤 Author
**Manish Singh**
— Created for learning and hands-on practice with AWS + Terraform.

---
Happy Learning!