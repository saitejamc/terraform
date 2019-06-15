resource "aws_vpc" "vpc_tf" {
  cidr_block = "${var.vpc_cidr}"
  enable_dns_hostnames = true
  tags {
    Name = "Terraform VPC"
  }
}

resource "aws_subnet" "subnet1" {
  cidr_block = "${var.subnet1_cidr}"
  availability_zone = "${var.subnet1_az}"
  vpc_id = "${aws_vpc.vpc_tf.id}"
  tags {
    Name = "PublicTF"
  }
}

resource "aws_subnet" "subnet2" {
  cidr_block = "${var.subnet2_cidr}"
  availability_zone = "${var.subnet2_az}"
  vpc_id = "${aws_vpc.vpc_tf.id}"
  tags {
    Name = "PrivateTF"
  }
}


resource "aws_internet_gateway" "vpc_ig" {
  vpc_id = "${aws_vpc.vpc_tf.id}"
  tags {
    Name = "TerraformIGW"
  }
}

resource "aws_route_table" "default" {
  vpc_id = "${aws_vpc.vpc_tf.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.vpc_ig.id}"
  }
  tags {
    Name = "TerraformRouteTable"
  }
}

resource "aws_security_group" "allow_all" {
  name = "AllowAll"
  description = "Allows full access"
  vpc_id = "${aws_vpc.vpc_tf.id}"
  tags {
    Name = "DefaultAllowAll"
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

output sg_allow_all_id {
  value = "${aws_security_group.allow_all.id}"
}

output subnet1_id {
  value = "${aws_subnet.subnet1.id}"
}

output subnet2_id {
  value = "${aws_subnet.subnet2.id}"
}

output vpc_vpc_tf_id {
  value = "${aws_vpc.vpc_tf.id}"
}
