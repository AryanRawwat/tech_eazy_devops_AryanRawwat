variable "aws_region" {
  default = "ap-south-1"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  type = string
}

variable "stage" {
  type = string
}

variable "repo_url" {
  type = string
}

