resource "aws_instance" "amazon_node" {
  ami           = var.amazon_linux
  instance_type = var.instance_type
  key_name      = var.key_name
  vpc_security_group_ids = [aws_security_group.ansible_child_sg.id]
  tags = merge(
    local.common_tags,
    {
      Name = "${var.project}-${var.environment}-Child1"
      Role = "Controller"
    }
  )
}


resource "terraform_data" "amazon_node" {

  triggers_replace = [
    aws_instance.amazon_node.id
  ]
  
  connection {
    type = "ssh"
    user = "ec2-user"
    private_key = file("terraform-key.pem")
    host = aws_instance.amazon_node.public_ip
  }

  provisioner "file" {
    source = "bootstrap.sh"
    destination = "/tmp/bootstrap.sh"
  }

  provisioner "remote-exec" {
    inline = [ 
      "chmod +x /tmp/bootstrap.sh",
      "sudo /tmp/bootstrap.sh ansible-node1"
     ]
    
  }
}