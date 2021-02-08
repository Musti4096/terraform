
provider "aws"{
    profile="default"
    region="us-east-1"
}

resource "aws_instance" "webserver" {
    ami = "ami-047a51fa27710816e"
    instance_type = var.instancetype  
}