resource "aws_vpc" "kafka_vpc" {
  cidr_block = "10.0.0.0/16"

    tags {
    Name = "${var.my_tag}"
  }
}
