terraform {
  backend "s3" {
    bucket = "terraform-state-task1-rs1"
    key    = "terraform/state.tfstate"
    region = "eu-central-1"
    dynamodb_table = "terraform-state-lock"
  }
}
