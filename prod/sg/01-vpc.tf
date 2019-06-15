module "vpc" {
  source = "../../modules/vpc"
  vpc_cidr = "15.0.0.0/16"
  subnet1_cidr = "15.0.1.0/24"
  subnet1_az = "us-east-2a"
  subnet2_cidr = "15.0.2.0/24"
  subnet2_az = "us-east-2b"
}
