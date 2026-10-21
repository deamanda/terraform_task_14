#!/bin/bash
sudo dnf check-update
sudo dnf install -y httpd jq
sudo systemctl enable httpd
sudo systemctl start amazon-ssm-agent

instanceId=$(curl -H "X-aws-ec2-metadata-token: ${TOKEN}" http://169.254.169.254/latest/meta-data/instance-id)
TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")
uuid=$(cat /sys/devices/virtual/dmi/id/product_uuid | tr '[:upper:]' '[:lower:]')

echo "<h1>This message was generated on instance (${instanceId}) with the following UUID ${uuid}</h1>" > /var/www/html/index.html
sudo systemctl start httpd