# variables for VPC

variable "cidr_block" {
  default = ""
}

variable "enable_dns_support" {
  type = bool
  default = true
}

variable "enable_dns_hostnames" {
  type = bool
  default = true
}


# variables for AWS subnet

variable "public_subnet" {
    default = ""
}

variable "public_subnet2" {
  default = ""
}


variable "vpc_id" {
  type = string

}

variable "map_public_ip_on_launch" {
  type        = bool
  default     = true
}

variable "aws_security_group" {
  default = ""

}
