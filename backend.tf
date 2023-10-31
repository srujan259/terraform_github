terraform {
  backend "s3" {
    bucket         = "srujan-state-s3-bucket" # change this
    key            = "github/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    # dynamodb_table = "terraform-lock"
  }
}