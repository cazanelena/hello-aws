terraform {
  required_version = ">= 1.2.0"

  backend "s3" {
    bucket = "terraform-state-at"
    key    = "atlantis-project"
    region = "eu-west-2"
  }
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-08d70e59c07c61a3a"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}
