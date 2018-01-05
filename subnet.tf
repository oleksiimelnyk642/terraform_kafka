resource "aws_subnet" "az1_public_subnet" {
  vpc_id     = "${aws_vpc.kafka_vpc.id}"
  cidr_block = "10.0.1.0/24"

  tags {
    Name = "${var.my_tag}"
  }
}
