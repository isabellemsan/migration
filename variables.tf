variable "igw_name" {
  description = "name of the internet gateway"
  type        = string
}

variable "nat_gw_name" {
  description = "name of the nat gateway"
  type        = string
}

variable "ec2_type_db" {
  description = "type of ec2 instance"
  type        = string
}

variable "ec2_type_webserver" {
  description = "type of webserver instance"
  type        = string
}

variable "webserver_sg_name" {
  description = "The name of the webserver SG"
  type        = string
}

variable "db_sg_name" {
  description = "The name of the database SG"
  type        = string
}

variable "keypair_name" {
  description = "keypair"
  type        = string
}


variable "ubuntu_image_name" {
  description = "The name of the AMI"
  type        = string
}

variable "ubuntu_image_owner" {
  description = "The owner ID of the AMI"
  type        = string
}

