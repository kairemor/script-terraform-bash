variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "private_key_path" {}
variable "key_name" {}
variable "region" {
  default = "us-east-2"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "image_id" {
  description = "AMI image identifier"
  default     = "ami-00399ec92321828f5"
}

variable "backend_bash_path" {
  default = "init-springboot.sh"
}

variable "frontend_bash_path" {
  default = "init-angular.sh"
}


variable "database_bash_path" {
  default = "init-mysql.sh"
}

variable "aws_security_group_id" {
  default = "sg-0257b24f8f7ea0330"
}
