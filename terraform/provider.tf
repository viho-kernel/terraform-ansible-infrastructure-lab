terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.36.0"
    }
  }

  backend "s3" {
    bucket         = "ansible-terraform-bucket"
    key            = "LockID ::ansible-terraform.tfstate"
    region         = "eu-west-2"
    encrypt        = true
    dynamodb_table = "ansible-terraform-table"

  }
}

provider "aws" {
  region = "eu-west-2"

}