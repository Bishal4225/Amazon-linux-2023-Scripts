#!/bin/bash
# Script to install Grafana on Amazon Linux 2 / Amazon Linux 2023
# Belongs to "CLOUDASEEM" YouTube Channel

# Detect package manager
if command -v dnf >/dev/null 2>&1; then
    PKG_MGR="dnf"   # Amazon Linux 2023
else
    PKG_MGR="yum"   # Amazon Linux 2
fi

echo "📦 Installing dependencies..."
sudo $PKG_MGR install -y wget

echo "⬇️ Adding Grafana repo..."
cat <<EOF | sudo tee /etc/yum.repos.d/grafana.repo
[grafana]
name=Grafana OSS
baseurl=https://packages.grafana.com/oss/rpm
repo_gpgcheck=1
enabled=1
gpgcheck=1
gpgkey=https://packages.grafana.com/gpg.key
EOF

echo "📦 Installing Grafana..."
sudo $PKG_MGR install -y grafana

echo "🚀 Starting and enabling Grafana service..."
sudo systemctl start grafana-server
sudo systemctl enable grafana-server

echo "✅ Grafana installation completed!"
echo "👉 Access Grafana at: http://<your-server-ip>:3000"
echo "   Default login → username: admin | password: admin"
