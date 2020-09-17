data "template_file" "user-dt"{
  template = "${file("${path.module}/user-dt.sh")}"

  }



resource "aws_instance" "myec2-1" {
  #name          = var.name
  ami           = var.ami
  instance_type = var.instance_type

  key_name      = var.key_name
  subnet_id     = var.public_subnet_id_1

  # user_data =  "${data.template_file.user-dt.rendered}"

    # user_data = var.user_data

  vpc_security_group_ids = var.vpc_security_group_ids

  #user_data = "${file("/user_data.sh")}

}


resource "aws_instance" "myec2-2" {
  #name          = var.name
  ami           = var.ami
  instance_type = var.instance_type

  key_name      = var.key_name
  subnet_id     = var.public_subnet_id_2

  # user_data =  "${data.template_file.user-dt.rendered}"

    # user_data = var.user_data

  vpc_security_group_ids = var.vpc_security_group_ids

  #user_data = "${file("/user_data.sh")}

}
