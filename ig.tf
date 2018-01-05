resource "aws_internet_gateway" "public_igw" {
  vpc_id = "${aws_vpc.kafka_vpc.id}"

  tags {
    Name = "${var.my_tag}"
  }
}
