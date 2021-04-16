terraform {
  backend "s3" {
    bucket         = "terraformbackendtask17042021"
    region         = "us-east-1"
    key            = "terraform"
    dynamodb_table = "terraform-lock"
  }
}
