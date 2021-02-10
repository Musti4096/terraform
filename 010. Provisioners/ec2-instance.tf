provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

/*Requirements:
    Project  "Redclif" required WebServer on AWS with nginx installed.
*/

/* Solution steps:
1. Create Key Pair to make SSH connection
2. Create Security group resource and allow Inbound and Outbiud rules.
3. Creation aws_instance resources called devbox
4. Within aws_instance block we will write connection blocks.
5. Write remote-exec provisioner block to execute command for nginx installation
*/

resource "aws_security_group" "allowssh" {
  name = "allowssh"

  ingress {
    description = "SSH anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "HTTP anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "outbound"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "webserver" {
  ami           = "ami-047a51fa27710816e"
  key_name      = "mustafa"
  instance_type = "t2.micro"
  vpc_security_group_ids = [ aws_security_group.allowssh.id ]

  tags = {
    "Name" = "Nginx-Server"
  }

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("./mustafa.pem")
      host        = self.public_ip
    }

    inline = [
      "sudo amazon-linux-extras install -y nginx1.12",
      "sudo systemctl start nginx",
    ]
  }
}