module "dev" {
  source = "./environments/dev"
}

module "test" {
  source = "./environments/test"
}

module "prod" {
  source = "./environments/prod"
}