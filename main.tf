

# update provider
#Aws as my provider
provider "aws" {
  region  =  var.vpc_region
  profile = "terraform"
}

#Resource defination
resource "aws_vpc" "IBM" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = var.vpc_name
  }
}
