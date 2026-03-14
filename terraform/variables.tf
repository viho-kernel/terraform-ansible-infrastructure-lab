variable "amazon_linux" {
  type    = string
  default = "ami-087c9ba923d9765d8"
}

variable "ubuntu_linux" {
  type    = string
  default = "ami-018ff7ece22bf96db"
}

variable "rhel_linux" {
  type    = string
  default = "ami-0620fe646b4b76c81"

}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "key_name" {
  default = "terraform-key"
}

variable "project" {
  type = string

  default = "Terraform-Ansible"

}

variable "environment" {
  type    = string
  default = "Test"

}

variable "owner" {
}