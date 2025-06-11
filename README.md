## 🏗️ Infrastructure Overview

The project uses Terraform to manage infrastructure on AWS with the following key components:
- S3 bucket for Terraform state management
- DynamoDB table for state locking
- AWS region: eu-central-1

## 🔧 Prerequisites

Before you begin, ensure you have the following:
- [Terraform](https://www.terraform.io/downloads.html) installed (version 1.0.0 or later)
- AWS CLI configured with appropriate credentials
- GitHub account with repository access
- AWS account with necessary permissions

## 🔐 Required Secrets

The following secrets need to be configured in your GitHub repository:
- `AWS_ACCESS_KEY_ID`: Your AWS access key
- `AWS_SECRET_ACCESS_KEY`: Your AWS secret key

## 🚀 CI/CD Pipeline

The project includes a GitHub Actions workflow that automates the following processes:

### 1. Terraform Format Check
- Validates Terraform code formatting
- Runs on every push and pull request

### 2. Terraform Plan
- Generates execution plan
- Saves plan as artifact
- Runs after successful format check

### 3. Terraform Apply
- Applies infrastructure changes
- Only runs on push to main branch
- Uses saved plan from previous step

## 🔄 State Management

The project uses remote state management with the following configuration:
- S3 bucket: `terraform-state-task1-rs`
- State file path: `terraform/state.tfstate`
- DynamoDB table: `terraform-state-lock`
- Region: `eu-central-1`

## 🔍 Monitoring and Maintenance

- State changes are tracked in S3
- State locking prevents concurrent modifications
- CI/CD pipeline provides automated validation and deployment
