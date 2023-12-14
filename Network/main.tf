terraform {
  cloud {
    organization = "hackerguru"

    workspaces {
      name = "VM_deployment"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.30.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    "Name" = "Module-Test"
  }
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.1.0/24"


  tags = {
    Name = "Main"
  }
}
