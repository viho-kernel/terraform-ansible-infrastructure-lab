data "http" "my_public_ip" {
  url = "https://icanhazip.com"
}

data "aws_vpc" "default" {
  default = true
}