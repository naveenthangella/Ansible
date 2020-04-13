provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "node1" {
  ami = "ami-0777ff5c030fe1d38"
  instance_type = "t2.micro"
  key_name = "devops"
  vpc_security_group_ids = ["sg-0183b01f41709052a","sg-0404201bfe4db9f05","sg-052d4431ac57068ba"]
  iam_instance_profile = "EC2-EC2-RO"
  tags = {
    Name = "Node1"
  }
}

/*resource "aws_instance" "node2" {
  ami = "ami-0777ff5c030fe1d38"
  instance_type = "t2.micro"
  key_name = "devops"
  vpc_security_group_ids = ["sg-0183b01f41709052a"]
  tags = {
    name = "Node2"
  }
} */

resource "local_file" "inventory" {
  filename = "/tmp/hosts"
  //content = "${aws_instance.node1.public_ip }\n${aws_instance.node2.public_ip}"
  content = aws_instance.node1.public_ip
}