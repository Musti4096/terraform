      
module "dev" {
    source = "../../modules/ec2"
    instancetype = "t2.micro"
}