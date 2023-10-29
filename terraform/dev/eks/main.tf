terraform {
  backend "s3" {
    bucket = "wl-dev-tfstate"
    key    = "dev/eks/main.tfstate"
    region = "us-east-1"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.23.0"
    }
  }
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "wl-dev-tfstate"
    key    = "dev/main.tfstate"
    region = "us-east-1"
  }
}
