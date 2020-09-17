output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}

output "public_subnet_id_1" {
  value = "${aws_subnet.PublicSubnet1.id}"
}

output "public_subnet_id_2" {
  value = "${aws_subnet.PublicSubnet2.id}"
}

output "security_group_id"{
  value = "${aws_security_group.SecurityGroup1.id}"
}

output "vpc_security_group_ids"{
  value = "${aws_vpc.vpc.default_security_group_id}"
}
