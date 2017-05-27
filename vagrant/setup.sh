#!/bin/bash

echo "Provisioning Development Environment for: Terraform"
echo "Install unzip"
sudo apt-get install unzip > /dev/null

echo "Install Vault"
sudo curl https://releases.hashicorp.com/terraform/0.9.6/terraform_0.9.6_linux_386.zip -o terraform.zip
sudo unzip terraform.zip
sudo mv terraform /usr/local/bin/terraform
echo "Installation Done"
