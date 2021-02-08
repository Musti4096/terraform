provider "aws" {
    profile = "default"
    region = "us-east-1"  
}

/* Requirement : Create 3 IAM user called
    1. User 1
    2. User 2
    3. User 3
*/

resource "aws_iam_user" "allUserList" {
    name = var.allUserList[count.index]
    count= length(var.allUserList)
    path = "/system/"
  
}