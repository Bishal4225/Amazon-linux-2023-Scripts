#!/bin/bash
# Script to install eksctl on an instance (Amazon Linux)

# Update system
sudo dnf update -y

# Download and extract the latest eksctl binary
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp

# Move eksctl to /usr/local/bin to make it executable globally
sudo mv /tmp/eksctl /usr/local/bin

# Verify eksctl installation
eksctl version
