data "template_file" "appserver-data" {
  template = "${file("template/appserver-data.tpl")}"
}

resource "aws_instance" "AppServerBox" {
  ami                         = "${var.ami_id}"
  instance_type               = "${var.instance_type}"
  associate_public_ip_address = true
  ebs_optimized               = false
  key_name                    = "${var.key_name}"
  user_data                   = "${data.template_file.appserver-data.rendered}"
  #subnet_id                   = "${aws_subnet.public[0]}"
  subnet_id              = "${var.subnet_id}"
  vpc_security_group_ids = "${var.security_group_id}"

  tags = {
    Name = "AppServerBox"
  }
}

resource "aws_security_group" "appserver_allow" {
  security_group_id  = "${var.security_group_id}"
  description = "Allow all inbound traffic"
  vpc_id      = "${var.vpc_id}"
}

