#!/bin/bash
# Script to install AWS CLI v2 on Amazon Linux 2023

# Update system
sudo dnf update -y

# Install unzip if not already installed
sudo dnf install unzip -y

# Download the AWS CLI installer
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

# Unzip the AWS CLI installer
unzip awscliv2.zip

# Run the AWS CLI installation script
sudo ./aws/install

# Verify installation
aws --version
