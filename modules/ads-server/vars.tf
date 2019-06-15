variable "ami" {
type = "map"
description = "AMI to select using the region"

default {
  "sg" = "ami-c26e4ca7"
  "de" = "ami-c26e4ca7"
  "us-east-1" = "ami-00769ca587d8e100c"
}
}

variable "instance_type" {
  default = "t2.micro"
}
variable "subnet_id" { }
#variable "az" {}
variable "tag_name" { }
variable "count" {
  default = "1"
}
variable "user_data" { }
variable "sgid" {
  type = "list"
  }
variable "sg_vpc_id" { }
variable "region" { }
