provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

/* Requirement : Create 25 Users within IAM from the given CSV.
*/
locals {
  UserList = file("${path.module}/UserAccess.csv")
  allUser  = csvdecode(local.UserList)
}
resource "aws_iam_user" "allUserList" {
  for_each = { for user in local.allUser : user.UsersName => user }
  name     = each.value.UsersName
  path     = "/system/"
}