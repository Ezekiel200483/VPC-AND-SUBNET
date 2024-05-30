provider "aws" {
  profile = "default"
  region  = "eu-west-3"  # Ensure you are operating in the correct region
}

variable "cidr_blocks" {
  description = "CIDR blocks and name tags for VPC and subnets"
  type        = list(object({
    cidr_block = string
    name       = string 
  }))
} 

resource "aws_vpc" "development_vpc" {
  cidr_block = var.cidr_blocks[0].cidr_block # Access the first element of the list

  tags = {
    Name = var.cidr_blocks[0].name 
  }
}

resource "aws_subnet" "dev_subnet_1" {
  vpc_id            = aws_vpc.development_vpc.id 
  cidr_block        = var.cidr_blocks[1].cidr_block # Access the second element of the list
  availability_zone = "eu-west-3a"

  tags = {
    Name = var.cidr_blocks[1].name 
  }
}


