terraform {
  backend "s3" {
    bucket = "wl-dev-tfstate"
    key    = "dev/eks/cluster1/main.tfstate"
    region = "us-east-1"
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

data "terraform_remote_state" "eks" {
  backend = "s3"
  config = {
    bucket = "wl-dev-tfstate"
    key    = "dev/eks/main.tfstate"
    region = "us-east-1"
  }
}
