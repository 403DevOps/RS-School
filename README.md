# Terraform Backend Configuration

This repository defines a **Terraform backend** using **Amazon S3** for persistent state storage and **DynamoDB** for state locking.

## Backend Overview

### Terraform State Storage
- **S3 Bucket**: `terraform-state-task1-rs`
- **State File Key**: `terraform/state.tfstate`
- **Region**: `eu-central-1`

### State Locking
- **DynamoDB Table**: `terraform-state-lock`
- Used to prevent concurrent Terraform executions and ensure consistency.

## Setup Instructions

### Prerequisites
1. **Ensure S3 bucket exists**:
   ```sh
   aws s3api create-bucket --bucket terraform-state-task1-rs --region eu-central-1
Create DynamoDB table for state locking:

sh
aws dynamodb create-table \
  --table-name terraform-state-lock \
  --attribute-definitions AttributeName=LockID,AttributeType=S \
  --key-schema AttributeName=LockID,KeyType=HASH \
  --provisioned-throughput ReadCapacityUnits=1,WriteCapacityUnits=1
Usage

2. **Terraform will automatically use this backend configuration when initializing**:

   ```sh 
   terraform init

