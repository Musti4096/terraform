resource "aws_instance" "name" {
    ami = "ami-047a51fa27710816e"
    instance_type = var.instancetype

}