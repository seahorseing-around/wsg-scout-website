terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }

  backend "s3" {
    bucket         = "wsgwebsite-terraform-state"
    region         = "eu-west-2"
    encrypt        = true
    dynamodb_table = "wsg-site-tf-state-lock-dynamo"
  }
}

provider "aws" {
  region = "eu-west-2"
}

provider "aws" {
  alias  = "acm_provider"
  region = "us-east-1"
}

