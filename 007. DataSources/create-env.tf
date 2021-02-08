provider "aws" {
    profile = "default"
    region = "us-east-1"
  
}

data "aws_ami" "ubuntu" {
  most_recent = true

    filter {
      name = "name"
      values = [ "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*" ]
    }

    filter {
      name      =   "virtualization-type"
      values    =   var.filtervalue
    }   

}

resource "aws_instance" "web" {
    ami = data.aws_ami.ubuntu.id
    instance_type = var.instancetype

    tags = var.tagsname

}