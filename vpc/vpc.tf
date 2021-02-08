#provider
provider "aws" {
    profile = "default"
    region = "us-east-1" 
}

#resource
resource "aws_security_group" "variablelab" {
    name = "demoTfVariables"

    ingress  {
      cidr_blocks = [ var.cidrip]
      from_port = 443
      protocol = "tcp"
      to_port = 443
    } 
  
    ingress   {
      cidr_blocks = [ var.cidrip ]
      from_port = 80
      protocol = "tcp"
      to_port = 80
    }
}