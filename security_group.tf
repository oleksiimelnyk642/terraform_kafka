resource "aws_security_group" "base_security_group" {
  name        = "base_security_group"
  description = "Base Security Group"
  vpc_id      = "${aws_vpc.kafka_vpc.id}"  

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  tags {
    Name = "${var.my_tag}"
  }

}

# Define sg rules

resource "aws_security_group_rule" "allow_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.base_security_group.id}"
}

resource "aws_security_group_rule" "zookeeper_follower_port" {
  type              = "ingress"
  from_port         = 2888
  to_port           = 2888
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.base_security_group.id}"
}

resource "aws_security_group_rule" "zookeeper_leeder_port" {
  type              = "ingress"
  from_port         = 3888
  to_port           = 3888
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.base_security_group.id}"
}

resource "aws_security_group_rule" "zookeeper_port_for_clients" {
  type              = "ingress"
  from_port         = 2181
  to_port           = 2181
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.base_security_group.id}"
}

resource "aws_security_group_rule" "kafka_listeners" {
  type              = "ingress"
  from_port         = 9092
  to_port           = 9092
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.base_security_group.id}"
}






















