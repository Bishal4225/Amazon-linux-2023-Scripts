#!/bin/bash
# Script to install Trivy on Amazon Linux

echo "📦 Installing dependencies..."
sudo yum install wget -y  # Use dnf if you're on Amazon Linux 2023

echo "🔑 Adding Trivy repository..."
sudo rpm --import https://aquasecurity.github.io/trivy-repo/rpm-public.gpg
sudo wget -O /etc/yum.repos.d/trivy.repo https://aquasecurity.github.io/trivy-repo/rpm/releases/trivy.repo

echo "📥 Updating packages..."
sudo yum update -y  # Use dnf for AL2023

echo "🚀 Installing Trivy..."
sudo yum install trivy -y  # Use dnf for AL2023

echo "✅ Trivy installation complete!"
trivy --version
