terraform {
  backend "s3"{
      bucket = "mustafa-rbp"
      key = "remotebackenddemo.tfstate"
      region = "us-east-1"
      dynamodb_table = "table_state_lock"
  }
}