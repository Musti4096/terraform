provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

/* Requirements : Create environment as per specified value. If user
specify PROD then t2.xlarge instance get created else t2.micro gets
created. 
<Conditon> ? 1 : 0 
*/

resource "aws_instance" "PROD" {
  ami           = "ami-047a51fa27710816e"
  instance_type = "t2.xlarge"
  count         = var.env == "PROD" ? 1 : 0
}

resource "aws_instance" "DEV" {
  ami           = "ami-047a51fa27710816e"
  instance_type = "t2.micro"
  count         = var.env == "DEV" ? 1 : 0
}