#Here we are going to create a controller node which can directly interact with the child nodes
resource "aws_instance" "controller" {
  ami                    = var.amazon_linux
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.ansible_controller_sg.id]
  tags = merge(
    local.common_tags,
    {
      Name = "${var.project}-${var.environment}-Controller"
      Role = "Controller"
    }
  )

}

resource "terraform_data" "controller" {

  triggers_replace = [
    aws_instance.controller.id
  ]
  
  connection {
    type = "ssh"
    user = "ec2-user"
    private_key = file("terraform-key.pem")
    host = aws_instance.controller.public_ip
  }

  provisioner "file" {
    source = "bootstrap.sh"
    destination = "/tmp/bootstrap.sh"
  }

  provisioner "remote-exec" {
    inline = [ 
      "chmod +x /tmp/bootstrap.sh",
      "sudo /tmp/bootstrap.sh ansible-controller"
     ]
    
  }
}