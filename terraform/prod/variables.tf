variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "private_key_path" {}
variable "key_name" {}
variable "region" {
  default = "us-east-2"
}

variable "ressource_name" {
  default = "project_name"
}

variable "front_project_name" {
  default = "test-angu"
}

variable "back_project_name" {
  default = "test-angu"
}


variable "main_file" {
  default = "index.js"
}

variable "db_uri" {
  default = "test-angu"
}


variable "project_repository" {
  default = "https://github.com/kairemor/test-angu.git"
}


variable "jar_file_url" {
  default = "https://github.com/kairemor/spring-boot-dockerise/blob/master/cloud-devops-0.0.1-SNAPSHOT.jar?raw=true"
}

variable "backend_port" {
  default = 8090
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
  default = "init-springboot.tpl"
}

variable "frontend_bash_path" {
  default = "init-angular.tpl"
}
