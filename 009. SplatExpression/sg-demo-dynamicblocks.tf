resource "aws_security_group" "dsgmultiport" {
  name = "WithDynamicBlocSG"

  dynamic "ingress" {
    for_each = var.allports
    iterator = port
    content {
      cidr_blocks      = ["10.0.0.0/24"]
      from_port        = port.value
      protocol         = "tcp"
      to_port          = port.value
    }
  }

}

output "port" {
  value = aws_security_group.dsgmultiport.ingress[*].from_port
}