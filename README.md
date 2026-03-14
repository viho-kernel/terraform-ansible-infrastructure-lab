# Terraform + Ansible Infrastructure Automation Lab

## 📌 Project Overview

This project demonstrates how to automate infrastructure provisioning and configuration management using **Terraform** and **Ansible** on AWS.

The goal of this lab is to build a real-world DevOps workflow where:

* Infrastructure is created using Terraform
* Ansible controller node is automatically configured
* SSH keys are generated and distributed
* Nodes can be managed securely using Ansible

This project simulates a real DevOps environment where infrastructure provisioning and configuration management are integrated together.

---

## 🏗 Architecture

Terraform provisions the infrastructure on AWS and creates the following components:

* **1 Ansible Controller Node**
* **Multiple Managed Nodes**
* **Security Groups for SSH access**

After infrastructure creation:

* Controller node installs Ansible
* SSH keys are generated for the `ansadmin` user
* Keys are copied to managed nodes
* Passwordless SSH communication is established

---

## ⚙️ Tools & Technologies Used

* Terraform
* Ansible
* AWS EC2
* Bash Scripting
* SSH Key Authentication
* Ansible Vault (for secrets management)

---

## 📂 Project Structure

```
terraform-ansible-infrastructure-lab
│
├── terraform
│   ├── main.tf
│   ├── variables.tf
│   ├── security_groups.tf
│   └── outputs.tf
│
├── ansible
│   ├── inventory.ini
│   ├── ansible.cfg
│   ├── playbooks
│   │   └── controller-setup.yaml
│   └── secrets.yaml
│
├── bootstrap.sh
└── README.md
```

---

## 🚀 Workflow

1. **Provision Infrastructure**

```
terraform init
terraform plan
terraform apply
```

2. **Controller Setup**

* Ansible is installed on the controller
* `ansadmin` user is created
* SSH key pair is generated

3. **Node Configuration**

* Controller public key is copied to all managed nodes
* Passwordless SSH access is enabled

4. **Secure Secrets Management**

* Sensitive data such as passwords are encrypted using Ansible Vault.

---

## 🔐 Security Practices Implemented

* Passwordless SSH authentication
* Secrets encrypted using Ansible Vault
* Sensitive files excluded using `.gitignore`
* Private keys not committed to Git

---

## 📖 Learning Outcomes

Through this project I learned:

* Infrastructure provisioning using Terraform
* Automating server configuration with Ansible
* SSH key based authentication
* Secure secret management
* Integrating Terraform with Ansible

---

## 🧠 Future Improvements

* Automatic Ansible inventory generation using Terraform
* Fully automated Terraform → Ansible pipeline
* Dynamic inventory for AWS instances
* CI/CD integration

---

## 👨‍💻 Author

**Vihari Reddy**

DevOps / Cloud Engineering 
Infrastructure Automation and Cloud Technologies
