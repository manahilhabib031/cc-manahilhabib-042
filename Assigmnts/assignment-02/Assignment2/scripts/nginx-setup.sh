#!/bin/bash
set -e

# Update system
yum update -y

# Install Nginx
amazon-linux-extras install nginx1 -y

# Start & enable Nginx
systemctl start nginx
systemctl enable nginx

# Get metadata token (IMDSv2)
TOKEN=$(curl -s -X PUT "http://169.254.169.254/latest/api/token" \
  -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

PRIVATE_IP=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" \
  http://169.254.169.254/latest/meta-data/local-ipv4)

INSTANCE_ID=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" \
  http://169.254.169.254/latest/meta-data/instance-id)

# Set hostname
hostnamectl set-hostname myapp-frontend

# Create Nginx reverse proxy config
cat > /etc/nginx/conf.d/reverse-proxy.conf <<EOF
upstream backend_servers {
    server backend.internal:80;
}

server {
    listen 80;
    server_name _;

    location / {
        proxy_pass http://backend_servers;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
    }
}
EOF

# Create index page
cat > /usr/share/nginx/html/index.html <<EOF
<!DOCTYPE html>
<html>
<head>
    <title>Frontend Server</title>
    <style>
        body {
            font-family: Arial;
            background: linear-gradient(135deg, #11998e, #38ef7d);
            color: white;
            padding: 40px;
        }
        .box {
            background: rgba(0,0,0,0.3);
            padding: 30px;
            border-radius: 10px;
        }
        .label { color: #ffeb3b; font-weight: bold; }
    </style>
</head>
<body>
<div class="box">
<h1>🌐 Frontend (Nginx Reverse Proxy)</h1>
<p><span class="label">Hostname:</span> $(hostname)</p>
<p><span class="label">Instance ID:</span> $INSTANCE_ID</p>
<p><span class="label">Private IP:</span> $PRIVATE_IP</p>
<p><span class="label">Status:</span> ✅ Active</p>
<p><span class="label">Role:</span> Reverse Proxy + Load Balancer</p>
</div>
</body>
</html>
EOF

# Restart Nginx
systemctl restart nginx

echo "Nginx frontend setup completed!"
