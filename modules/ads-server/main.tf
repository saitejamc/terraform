resource "aws_instance" "instance" {
  ami = "${lookup(var.ami,var.region)}"
  count = "${var.count}"
  instance_type = "${var.instance_type}"
  subnet_id = "${var.subnet_id}"
  user_data = "${var.user_data}"
  key_name = "sam-media-root"
  vpc_security_group_ids = ["${var.sgid}"]

  tags {
    Name = "${var.tag_name}-${count.index}"
  }
}

resource "aws_security_group" "sg_ads" {
  name = "ads-server"
  description = "Security group for Ads"
  vpc_id = "${var.sg_vpc_id}"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 24
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 8081
    to_port     = 8082
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "sg_ads_id" {
  value = "${aws_security_group.sg_ads.id}"
}


resource "aws_eip" "elasticip" {
  count = "${var.count}"
  vpc = true
  instance = "${element(aws_instance.instance.*.id, count.index)}"
}
