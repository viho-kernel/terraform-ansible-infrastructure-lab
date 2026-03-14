resource "aws_security_group" "ansible_controller_sg" {
  name   = "ansible-controller-sg"
  vpc_id = local.vpc_id

  dynamic "ingress" {
    for_each = local.ingress_rules
    content {
      description = ingress.value.description
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  egress {
    description = "Allow all traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project}-${var.environment}-Controller-SG"
    }
  )


}


resource "aws_security_group" "ansible_child_sg" {
  name   = "ansible-child-sg"
  vpc_id = local.vpc_id

  ingress {
    description    = "Allow SSH only from controller SG"
    from_port      = 22
    to_port        = 22
    protocol       = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP public
  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Application port restricted to controller
  ingress {
    description    = "Allow App traffic from controller"
    from_port      = 8080
    to_port        = 8080
    protocol       = "tcp"
    cidr_blocks =  ["0.0.0.0/0"]
  }

    # ICMP (ping) from controller
  ingress {
    description    = "Allow ICMP from controller"
    from_port      = -1
    to_port        = -1
    protocol       = "icmp"
    security_groups = [aws_security_group.ansible_controller_sg.id]
  }
  
  egress {
    description = "Allow all traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project}-${var.environment}-Child-SG"
    }
  )
}