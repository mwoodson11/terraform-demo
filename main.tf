# resource "aws_instance" "my_vm" {
#   ami           = "ami-01d9a63b83a0d25ee" //Ubuntu AMI
#   instance_type = "hvm:ebs-ssd"

#   tags = {
#     Name = "My EC2 instance",
#   }
# }

provider "aws" {
  version = "~> 2.0"
  region  = "eu-central-1"
}

terraform {
  backend "s3" {
    bucket = "mswoodson-example-terraform"
    key    = "default-infrastructure"
    region = "eu-central-1"
  }
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "mswoodson-example-terraform"

  versioning {
    enabled = true
  }
}