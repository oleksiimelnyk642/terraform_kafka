resource "aws_route_table" "public_rt" {
  vpc_id = "${aws_vpc.kafka_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.public_igw.id}"
  }

  tags {
    Name = "${var.my_tag}"
  }
}

resource "aws_route_table_association" "public_rt_as" {
  subnet_id      = "${aws_subnet.az1_public_subnet.id}"
  route_table_id = "${aws_route_table.public_rt.id}"

}
