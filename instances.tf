resource "aws_instance" "kafka_broker0" {
  ami                         = "${var.ami}"
  instance_type               = "${var.aws_instance_type}"
  key_name                    = "${var.aws_key_pair}"
  security_groups             = ["${aws_security_group.base_security_group.id}"]
  associate_public_ip_address = true
  subnet_id                   = "${aws_subnet.az1_public_subnet.id}"

  user_data = "${file("./files/kafka0.sh")}"

  tags {
    Name = "${var.my_tag}"
  }
}

resource "aws_instance" "kafka_broker1" {
  ami                         = "${var.ami}"
  instance_type               = "${var.aws_instance_type}"
  key_name                    = "${var.aws_key_pair}"
  security_groups             = ["${aws_security_group.base_security_group.id}"]
  associate_public_ip_address = true
  subnet_id                   = "${aws_subnet.az1_public_subnet.id}"

  user_data = "${file("./files/kafka1.sh")}"

  tags {
    Name = "${var.my_tag}"
  }
}

resource "aws_instance" "kafka_broker2" {
  ami                         = "${var.ami}"
  instance_type               = "${var.aws_instance_type}"
  key_name                    = "${var.aws_key_pair}"
  security_groups             = ["${aws_security_group.base_security_group.id}"]
  associate_public_ip_address = true
  subnet_id                   = "${aws_subnet.az1_public_subnet.id}"

  user_data = "${file("./files/kafka2.sh")}"

  tags {
    Name = "${var.my_tag}"
  }
}

resource "aws_instance" "zookeeper" {
  ami                         = "${var.ami}"
  instance_type               = "${var.aws_instance_type}"
  key_name                    = "${var.aws_key_pair}"

  user_data = "${file("./files/zookeeper.sh")}"

  network_interface {
    network_interface_id = "${aws_network_interface.zookeeper_eni.id}"
    device_index         = 0
  }

  tags {
    Name = "${var.my_tag}"
  }
}
