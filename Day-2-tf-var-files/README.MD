# Terraform AWS EC2 Instance with Variables and Outputs

This Terraform project provisions a single AWS EC2 instance using input variables for configuration and outputs important instance information after deployment.

---

## Project Overview

- Creates **one EC2 instance** in a specified AWS region.
- Uses variables declared in `variables.tf` for flexibility (e.g., AMI ID, instance type, SSH key name).
- Outputs useful information (like public IP and instance ID) after applying the configuration.

---

## File Structure

- `main.tf` — Contains the EC2 resource and provider configuration.
- `provider.tf` – Specifies the AWS provider configuration.
- `variables.tf` — Declares input variables for the Terraform configuration.
- `outputs.tf` — Defines outputs to display information post-deployment.

---

## Prerequisites

- Terraform installed ([install guide](https://www.terraform.io/downloads.html))
- AWS account and IAM credentials configured (e.g., using `aws configure`)

---

## Usage Instructions

1. **Initialize Terraform**

    ```
    terraform init
    ```

2. **Plan the deployment**

    Provide values for required variables (`ami` and `key_name`) either via CLI or `terraform.tfvars` file.

    Example with CLI variables:

    ```
    terraform plan -var="ami=ami-0youramiid" -var="key_name=your-key-name"
    ```

3. **Apply the configuration**

    ```
    terraform apply -var="ami=ami-0youramiid" -var="key_name=your-key-name"
    ```
    - Type `yes` when prompted.

4. **View the outputs**

    After successful apply, Terraform will display outputs like the instance public IP.

5. **Destroy resources when no longer needed**

    ```
    terraform destroy -var="ami=ami-0youramiid" -var="key_name=your-key-name"
    ```

---

## Notes

- Replace `ami` value with a valid AMI ID available in your AWS region.
- Ensure the `key_name` matches an SSH key pair already created in your AWS account.
- Creating EC2 instances may incur AWS charges — remember to destroy your resources if not needed.
- Use variable files (`terraform.tfvars`) or environment variables for cleaner commands if preferred.

## 👤 Author
**Manish Singh**
— Created for learning and hands-on practice with AWS + Terraform.

---
Happy Learning!
