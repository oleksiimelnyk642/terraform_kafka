resource "aws_network_interface" "zookeeper_eni" {
  description     = "zookeeper_eni"
  subnet_id       = "${aws_subnet.az1_public_subnet.id}"
  private_ips     = ["10.0.1.150"]
  security_groups = ["${aws_security_group.base_security_group.id}"]

  tags {
    Name = "${var.my_tag}"
  }
}
