terraform {
  backend "s3" {
    bucket = "sai-tf-state"
    key    = "sg-terraform.tfstate"
    region = "us-east-2"
    access_key = "<AWS_ACCESS_KEY>"
    secret_key = "<AWS_SECRET_KEY>"
  }
}

