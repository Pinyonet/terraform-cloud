terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.63.0, <5.81.0, !=5.79.0"
    }

    random = {
      source = "hashicorp/random"
      version = "3.7.1"
    }

    
  }
  required_version = "~>1.8.0"
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
  default_tags {
    tags = var.tags
  }
}
