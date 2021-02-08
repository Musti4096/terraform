resource "aws_security_group" "sg-multiport" {
  name = "WithoutDynamicBlocSG"

  ingress {
    cidr_blocks      = ["10.0.0.0/24"]
    from_port        = 7900
    protocol         = "tcp"
    to_port          = 7900
  }

  ingress {
    cidr_blocks      = ["10.0.0.0/24"]
    from_port        = 5234
    protocol         = "tcp"
    to_port          = 5234
  }

  ingress {
    cidr_blocks      = ["10.0.0.0/24"]
    from_port        = 6300
    protocol         = "tcp"
    to_port          = 6300
  }
}