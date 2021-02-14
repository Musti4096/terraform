provider "aws" {
    profile = "default"
    region = "us-east-1"  
}

resource "aws_instance" "prodbox" {
    ami = "ami-047a51fa27710816e"
    instance_type = "t2.micro"
}