locals {
  my_public_ip = chomp(data.http.my_public_ip.response_body)
  cidr_blocks  = ["${local.my_public_ip}/32"]
  vpc_id       = data.aws_vpc.default.id

  ingress_rules = [
    {
      description = "Allow HTTP"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      description = "Allow HTTPS"
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      description = "Allow SSH"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = local.cidr_blocks
    },
    {
      description = "Allow Application"
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  common_tags = {
    project     = var.project
    environment = var.environment
    owner       = var.owner
  }
}