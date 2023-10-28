terraform {
  backend "s3" {
    bucket = "wl-dev-tfstate"
    key    = "dev/main.tfstate"
    region = "us-east-1"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.23.0"
    }
  }
}

provider "aws" {
  region              = "us-east-1"
  allowed_account_ids = ["898344057637"]
}
