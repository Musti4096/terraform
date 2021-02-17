terraform {
  backend "remote" {
    organization = "musti4096"

    workspaces {
      name = "mustafa-dev"
    }
  }
}