      
module "prod" {
    source = "../../modules/ec2"
    instancetype = "t2.nano"
}