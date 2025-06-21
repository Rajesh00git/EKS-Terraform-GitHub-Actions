terraform {
  backend "s3" {
    bucket         = "jumpsever-bucket1"                          # S3 bucket name to store the state
    key            = "EKS-TERRAFORM-GITHUB-ACTIONS/eks/terraform.tfstate" # Path/key in S3 bucket
    region         = "us-east-1"                                   # AWS region
    dynamodb_table = "Lock-Files"                                  # DynamoDB table for state locking
    encrypt        = true                                          # Encrypt the state file at rest
  }

  required_version = ">= 0.13.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 2.7.0"
    }
  }
}

