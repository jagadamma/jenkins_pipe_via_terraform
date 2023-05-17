resource "aws_vpc" "vpc"{
   cidr_block           = "10.0.0.0/16"
   instance_tenancy     = "default"
   assign_generated_ipv6_cidr_block = true
   tags =   {
     Name = "myvpc"
   }
}
resource "aws_subnet" "pub_subnet-1"{  
    vpc_id =  aws_vpc.vpc.id
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = true
    availability_zone = "ap-south-1a"
  tags = {
    Name = "public-subnet-1" 
  }
}
resource "aws_subnet" "pub_subnet-2"{
    vpc_id =  aws_vpc.vpc.id
    cidr_block = "10.0.2.0/24"
    map_public_ip_on_launch = true
    availability_zone = "ap-south-1b"
  tags = {
    Name = "public-subnet-2" 
  }
}
