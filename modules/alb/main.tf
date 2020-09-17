
resource aws_alb "front_end" {

  name = "my-alb"

  load_balancer_type = "application"
  internal = var.internal


  subnets            = [var.subnet1,var.subnet2]
  security_groups    = [aws_security_group.my-alb-sg.id]

  ip_address_type = "ipv4"


  }

#############################################
# ALB Security Group

resource "aws_security_group" "my-alb-sg" {
  name   = "my-alb-sg"
  vpc_id = var.vpc_id
}

resource "aws_security_group_rule" "inbound_ssh" {
  from_port         = 22
  protocol          = "tcp"
  security_group_id = "${aws_security_group.my-alb-sg.id}"
  to_port           = 22
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "inbound_http" {
  from_port         = 80
  protocol          = "tcp"
  security_group_id = "${aws_security_group.my-alb-sg.id}"
  to_port           = 80
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "outbound_all" {
  from_port         = 0
  protocol          = "-1"
  security_group_id = "${aws_security_group.my-alb-sg.id}"
  to_port           = 0
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
}

##############################################
# Target group

resource "aws_lb_target_group" "test" {
  name     = "tf-example-lb-tg"
  port     = var.target_group_port
  protocol = var.target_group_protocol
  vpc_id   = var.vpc_id
  target_type =  var.target_type


health_check {
  healthy_threshold = 5
  unhealthy_threshold = 2
  timeout = 5
  protocol = "HTTP"
  path = "/"
  interval = 10
}

}

###############################################
# HTTP ALB TG attachment

resource "aws_alb_target_group_attachment" "my_alb_target_group_attachment1" {
  target_group_arn = "${aws_lb_target_group.test.arn}"
  target_id = "${var.instance1_id}"
  port = 80
}


resource "aws_alb_target_group_attachment" "my_alb_target_group_attachment2" {
  target_group_arn = "${aws_lb_target_group.test.arn}"
  target_id = "${var.instance2_id}"
  port = 80
}

###############################################
# HTTP Listener


  resource "aws_lb_listener" "front_end_listner" {
  load_balancer_arn = aws_alb.front_end.arn
  port              = var.port
  protocol          = var.protocol

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.test.arn
  }
}



###############################################
# Alb listner rule
