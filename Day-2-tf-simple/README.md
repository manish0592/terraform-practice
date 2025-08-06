# Day-2: Simple Terraform AWS EC2 Example

This project contains a basic Terraform configuration to create an AWS EC2 instance.  
It is intended as a beginner’s exercise using Terraform with AWS.

## Files

- `main.tf` – Contains the resource definition for the EC2 instance.
- `provider.tf` – Specifies the AWS provider configuration.

## What Does This Configuration Do?

- Deploys a single **t2.micro** EC2 instance in your AWS account using the AMI ID you specify.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed
- AWS account and credentials configured (e.g., via `aws configure`)

## Usage

1. **Clone this repository** (if using version control):
    ```
    git clone <repository-url>
    cd Day-2-tf-simple
    ```

2. **Initialize Terraform**:
    ```
    terraform init
    ```

3. **Check the execution plan**:
    ```
    terraform plan
    ```

4. **Apply the configuration**:
    ```
    terraform apply
    ```
    - Type `yes` when prompted.

5. **Destroy resources** (when no longer needed):
    ```
    terraform destroy
    ```

## Notes

- Update the `ami` value in `main.tf` to a valid, region-appropriate AMI ID.
- Resources created will incur AWS charges. Remember to destroy resources if not needed.
- Always follow security best practices with your AWS credentials.

## 👤 Author
**Manish Singh**
— Created for learning and hands-on practice with AWS + Terraform.

---
Happy Learning!
