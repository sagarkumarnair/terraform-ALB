variable "name" {
  default = ""
}


variable "load_balancer_type" {
  default = ""
}



variable "subnet1" {
  default = ""
}



variable "subnet2" {
  default = ""
}

variable "security_groups" {
  default = ""
}

# variable "target_groups" {
#   type = any
# }


# variable "http_tcp_listeners" {
#   type = any
# }

variable "internal" {
  default = ""
}

variable "port" {
  type = any
}

variable "protocol" {
  type = any
}


variable "target_group_port" {
  type = any
}

variable "target_group_protocol" {
  type = any
}

variable "target_type" {
  type = any
}






variable "instance1_id" {
  type = any
}

variable "instance2_id" {
  type = any
}


variable "vpc_id" {
  
}
