provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "node1" {
  ami = "ami-0777ff5c030fe1d38"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-0183b01f41709052a"]
  tags = {
    name = "Node1"
  }
}

resource "aws_instance" "node2" {
  ami = "ami-0777ff5c030fe1d38"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-0183b01f41709052a"]
  tags = {
    name = "Node2"
  }
}

resource "local_file" "inventory" {
  filename = "../host-inventory"
  content = "${aws_instance.node1.public_ip }\n${aws_instance.node2.public_ip}"
}