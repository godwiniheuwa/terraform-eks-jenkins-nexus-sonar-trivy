terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.60.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.1.0"  # Required version for the random provider
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">=2.7.1"  # Required version for the Kubernetes provider
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.1.0"  # Required version for the local provider
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
