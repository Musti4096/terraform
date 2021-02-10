provider "aws" {
    profile = "default"
    region = "us-east-1"    
}

resource "aws_instance" "webserver" {
    ami = "ami-047a51fa27710816e"
    instance_type = lookup(var.instancetype, terraform.workspace)   
}
/*
Requirement
Dev Workspace -t2.micro
Test Workspace -t2.small
Prod Workspace -t2.large
*/
 
variable "instancetype" {
    type= map(string)
    default = {
        default = "t2.nano"
        dev = "t2.micro"
        test = "t2.small"
        prod = "t2.large"
    } 
}