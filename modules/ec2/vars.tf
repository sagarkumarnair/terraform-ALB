variable "instance_type" {
  description = "instance type"
  type        = string
}

variable "ami" {
  description = "amazon mahcine image "
  type        = string
}

variable "key_name" {
  description = "keypair name"
  type        = string
  default     = ""
}

variable "user_data" {
  description = "startup script"
  type    = string
  default = ""
}

variable "name" {
  type = any
}

variable "public_subnet_id_1" {
  type = any

}

variable "public_subnet_id_2" {
  type = any

}


variable "aws_availability_zones" {
  default = ""
  type = string
}

variable "server_port" {
  default = 8080
}


variable "vpc_security_group_ids" {
  type = any
}

# variable "user_data" {
#   type = any
# }
