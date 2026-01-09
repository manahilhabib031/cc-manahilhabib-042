#!/bin/bash
set -e

# Update system
yum update -y

# Install Apache
yum install httpd -y

# Start and enable Apache
systemctl start httpd
systemctl enable httpd

# Get metadata token (IMDSv2)
TOKEN=$(curl -s -X PUT "http://169.254.169.254/latest/api/token" \
  -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

# Fetch metadata
PRIVATE_IP=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" \
  http://169.254.169.254/latest/meta-data/local-ipv4)

PUBLIC_IP=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" \
  http://169.254.169.254/latest/meta-data/public-ipv4)

PUBLIC_DNS=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" \
  http://169.254.169.254/latest/meta-data/public-hostname)

INSTANCE_ID=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" \
  http://169.254.169.254/latest/meta-data/instance-id)

# Set hostname
hostnamectl set-hostname myapp-backend

# Create HTML page
cat > /var/www/html/index.html <<EOF
<!DOCTYPE html>
<html>
<head>
    <title>Backend Server</title>
    <style>
        body {
            font-family: Arial;
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            padding: 40px;
        }
        .box {
            background: rgba(255,255,255,0.15);
            padding: 30px;
            border-radius: 10px;
        }
        .label { color: #ffd700; font-weight: bold; }
    </style>
</head>
<body>
<div class="box">
<h1>🚀 Backend Web Server – Assignment 2</h1>
<p><span class="label">Hostname:</span> $(hostname)</p>
<p><span class="label">Instance ID:</span> $INSTANCE_ID</p>
<p><span class="label">Private IP:</span> $PRIVATE_IP</p>
<p><span class="label">Public IP:</span> $PUBLIC_IP</p>
<p><span class="label">Public DNS:</span> $PUBLIC_DNS</p>
<p><span class="label">Deployed At:</span> $(date)</p>
<p><span class="label">Status:</span> ✅ Active</p>
<p><span class="label">Managed By:</span> Terraform</p>
</div>
</body>
</html>
EOF

chmod 644 /var/www/html/index.html

echo "Apache backend setup completed!"
