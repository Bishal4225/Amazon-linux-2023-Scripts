#!/bin/bash
# Script to install SonarQube on Amazon Linux 2 / Amazon Linux 2023
# Belongs to "CLOUDASEEM" YouTube Channel

# Variables
SONARQUBE_VERSION="9.9.4.87374"   # LTS version
SONAR_USER="sonar"
INSTALL_DIR="/opt/sonarqube"

echo "📦 Updating system..."
if command -v dnf >/dev/null 2>&1; then
    sudo dnf update -y
    PKG_MGR="dnf"
else
    sudo yum update -y
    PKG_MGR="yum"
fi

echo "📦 Installing dependencies..."
sudo $PKG_MGR install -y java-17-openjdk wget unzip

echo "👤 Creating SonarQube user..."
sudo useradd -r -s /bin/false $SONAR_USER

echo "⬇️ Downloading SonarQube..."
cd /tmp
wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-${SONARQUBE_VERSION}.zip

echo "📂 Extracting SonarQube..."
sudo unzip sonarqube-${SONARQUBE_VERSION}.zip -d /opt
sudo mv /opt/sonarqube-${SONARQUBE_VERSION} $INSTALL_DIR
sudo chown -R $SONAR_USER:$SONAR_USER $INSTALL_DIR

echo "⚙️ Creating SonarQube service..."
cat <<EOF | sudo tee /etc/systemd/system/sonarqube.service
[Unit]
Description=SonarQube service
After=syslog.target network.target

[Service]
Type=forking
ExecStart=$INSTALL_DIR/bin/linux-x86-64/sonar.sh start
ExecStop=$INSTALL_DIR/bin/linux-x86-64/sonar.sh stop
User=$SONAR_USER
Group=$SONAR_USER
Restart=always
LimitNOFILE=65536
LimitNPROC=4096

[Install]
WantedBy=multi-user.target
EOF

echo "🚀 Starting SonarQube..."
sudo systemctl daemon-reload
sudo systemctl enable sonarqube
sudo systemctl start sonarqube

echo "✅ SonarQube installation completed!"
echo "👉 Access SonarQube at: http://<your-server-ip>:9000"
echo "   Default login → username: admin | password: admin"
