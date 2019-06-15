resource "aws_instance" "instance" {
  ami = "${var.ami}"
  count = "${var.count}"
  instance_type = "${var.instance_type}"
  subnet_id = "${var.subnet_id}"
  user_data = "${var.user_data}"
  vpc_security_group_ids = ["${var.sgid}"]
  key_name = "sam-media-root"
  tags {
    Name = "${var.tag_name}-${count.index}"
  }

}
resource "aws_eip" "elasticip" {
  count = "${var.count}"
  vpc = true
  instance = "${element(aws_instance.instance.*.id, count.index)}"
}
