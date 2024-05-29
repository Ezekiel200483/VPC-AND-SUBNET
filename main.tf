provider "aws" {
 profile = "default"
}

resource "aws_vpc" "development_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "development_subnet" {
  vpc_id = aws_vpc.development_vpc.id
  cidr_block = "10.0.10.0/24"
    availability_zone = "eu-west-3a"
}

data "aws_vpc" "existing_vpc" {
  default = true
}

resource "aws_subnet" "development_subnet_2" {
  vpc_id = data.aws_vpc.existing_vpc.id
  cidr_block = "172.31.48.0/20"
    availability_zone = "eu-west-3a"
}
