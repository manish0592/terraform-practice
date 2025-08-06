# 🚀 Terraform Provisioning & files used

This repository contains a basic Terraform configuration for provisioning an EC2 instance on AWS using modular, reusable, and declarative code.

---

## 📁 Project Structure

```bash
.
├── main.tf           # Declares the AWS EC2 instance resource
├── variables.tf      # Input variables used in the configuration
├── provider.tf       # Provider configuration for AWS
├── outputs.tf        # Output values after applying the plan
├── terraform.tfvars  # (Optional) Actual variable values
└── README.md         # Project documentation
```

---

## 📦 File Descriptions

### `provider.tf`
This file configures the AWS provider.
- Sets the AWS region and credential profile using variables.
- Required to authenticate and interact with AWS resources.

```hcl
provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}
```

### `variables.tf`
Defines input variables for the project. Each variable can have:
- A **description** for documentation.
- A **default** value (optional).

These variables increase flexibility and reusability.

Example:
```hcl
variable "aws_region" {
  description = "AWS region to deploy resources"
  default     = "us-east-1"
}
```

### `main.tf`
This is the main configuration file that declares resources. In this case:
- It provisions an EC2 instance.
- Uses variables for AMI ID and instance type.
- Adds a tag for identification.

```hcl
resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "ExampleInstance"
  }
}
```

### `outputs.tf`
Defines output values that Terraform will display after the plan is applied.

Used for:
- Visibility of key resource attributes (like public IP)
- Passing outputs to modules or external scripts

Example:
```hcl
output "instance_public_ip" {
  value = aws_instance.example.public_ip
}
```

### `terraform.tfvars` (optional)
Used to assign actual values to variables defined in `variables.tf`.

Terraform automatically loads this file when running `terraform apply`.

Example:
```hcl
aws_region    = "us-east-1"
aws_profile   = "default"
instance_type = "t2.micro"
ami_id        = "ami-0c55b159cbfafe1f0"
```

You can also override values via:
- CLI: `-var="aws_region=us-west-2"`
- Environment: `export TF_VAR_aws_region=us-west-2`

---

## 🧠 How Terraform Tracks Resources

Terraform stores the actual infrastructure state in a file named `terraform.tfstate`.

This file:
- Records metadata and resource attributes (e.g., EC2 instance ID, AMI ID).
- Maps Terraform resources to real AWS infrastructure.
- Enables tracking and change detection during `plan` and `apply`.

Each resource is stored with:
- `type`: e.g., `aws_instance`
- `name`: from your HCL definition (e.g., `example`)
- `id`: the actual AWS resource ID (e.g., `i-12345678`)

Use these commands to interact with the state:
```bash
terraform state list       # List all tracked resources
terraform state show ...   # Show resource details
```

**Never manually edit `.tfstate`** unless you're 100% sure.

---

## 🛠️ Usage Instructions

### 1. Initialize the Terraform Project
```bash
terraform init
```

### 2. Review the Planned Actions
```bash
terraform plan
```

### 3. Apply the Configuration
```bash
terraform apply
```

### 4. Destroy the Infrastructure (when needed)
```bash
terraform destroy
```

---

## 🔐 Best Practices

- Add `.terraform/` and `terraform.tfstate*` to `.gitignore`
- Never commit secrets or credentials to Git
- Use remote state (e.g., S3 + DynamoDB) for team collaboration
- Validate and format code using:
  ```bash
  terraform fmt
  terraform validate
  ```

---

## 📄 References

- [Terraform Documentation](https://developer.hashicorp.com/terraform/docs)
- [AWS EC2 Documentation](https://docs.aws.amazon.com/ec2/)
- [Terraform AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)

---

## 👤 Author
**Manish Singh**
— Created for learning and hands-on practice with AWS + Terraform.

---
Happy Learning!
