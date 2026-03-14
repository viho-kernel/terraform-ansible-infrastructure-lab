output "controller_public_ip" {
    value = aws_instance.controller.public_ip
}

output "amazon_node_ip" {
  value = aws_instance.amazon_node.private_ip
}