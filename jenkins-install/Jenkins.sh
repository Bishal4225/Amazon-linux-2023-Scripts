#!/bin/bash
# This Script belongs to Bishal YouTube Channel #####
# Jenkins installation on Amazon Linux 2023

# Update system
sudo dnf update -y

# Install Java (Jenkins requires Java 11 or 17, we’ll use 17)
sudo dnf install -y java-17-amazon-corretto

# Add Jenkins repo
sudo curl -fsSL https://pkg.jenkins.io/redhat-stable/jenkins.repo -o /etc/yum.repos.d/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

# Install Jenkins
sudo dnf install -y jenkins

# Enable and start Jenkins service
sudo systemctl enable jenkins
sudo systemctl start jenkins

# Check status
sudo systemctl status jenkins --no-pager
