variable "ami" {  }
variable "instance_type" {
  default = "t2.micro"
}
variable "subnet_id" { }
#variable "az" {}
variable "tag_name" {}
variable "count" {
  default = "1" 
}
variable "user_data" { }
variable "sgid" { 
}
