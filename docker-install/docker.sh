#!/bin/bash
# Script to install Docker on an Amazon Linux 2023 EC2 instance and configure permissions

# Update the package list
sudo dnf update -y

# Install Docker
sudo dnf install docker -y

# Start and enable Docker service
sudo systemctl start docker
sudo systemctl enable docker

# Add the 'ec2-user' and 'jenkins' users to the 'docker' group
# (default user on Amazon Linux is 'ec2-user', not 'ubuntu')
sudo usermod -aG docker ec2-user
sudo usermod -aG docker jenkins

# Set correct permissions for the Docker socket
sudo chmod 660 /var/run/docker.sock
sudo chown root:docker /var/run/docker.sock

# Restart Docker to apply changes
sudo systemctl restart docker

# Verify installation
docker --version

# Example: Run SonarQube container in detached mode with port mapping
# docker run -d --name sonar -p 9000:9000 sonarqube:lts-community
