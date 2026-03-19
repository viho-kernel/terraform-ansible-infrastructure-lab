#!/bin/bash
set -e
HOSTNAME=$1
sudo hostnamectl set-hostname "$HOSTNAME"
sudo useradd ansadmin
echo 'ansadmin:admin123' | sudo chpasswd
# Grant sudo privileges
echo 'ansadmin ALL=(ALL) NOPASSWD: ALL' | sudo tee /etc/sudoers.d/ansadmin
# Enable password authentication in SSH
sudo sed -i 's/^#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
sudo sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
sudo systemctl restart sshd
# Install Python and Ansible
sudo yum install -y python3-pip
sudo pip3 install ansible
sudo dnf install git -y
sudo yum install sshpass -y
sudo su - ansadmin -c "ssh-keygen -t rsa -N '' -f ~/.ssh/id_rsa"