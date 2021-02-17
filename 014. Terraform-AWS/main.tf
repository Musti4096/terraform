#=========root/main.tf======#
module "networking" {
    source = "./networking"
    vpc_cidr = "10.123.0.0/16"
    public_sn_count = 2
    private_sn_count = 5
    max_subnets = 20
    public_cidrs = [for i in range(2, 255, 2) : cidrsubnet("10.123.0.0/16", 8 , i)]
    private_cidrs = [for i in range(1, 255, 2) : cidrsubnet("10.123.0.0/16", 8 , i)]
}