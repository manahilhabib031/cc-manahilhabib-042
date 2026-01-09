# Cloud Computing Assignment #02
**Name:** Manahil Habib  
**Reg No:** 2023-BSE-042  
**Section:** 5B  

## Overview
This project demonstrates the deployment of a **high-availability multi-tier web infrastructure on AWS** using **Terraform**.  
It includes:
- Nginx reverse proxy & load balancer (HTTPS, caching, failover)
- Three Apache backend servers (one backup)
- Modular Terraform design (networking, security, webserver)
- Automated server configuration using shell scripts

The goal is to gain hands-on experience with **Infrastructure as Code (IaC)**, **AWS networking**, and **advanced Nginx configurations**.

---

## Architecture
- **VPC** with public subnet
- **Internet Gateway & Routing**
- **Nginx EC2 Instance**
- **3 Apache EC2 Instances**
- **Security Groups** with least-privilege rules

---

## Project Structure
```
assignment-02/
│
├── modules/
│   ├── networking/
│   ├── security/
│   └── webserver/
│
├── scripts/
│   ├── apache_setup.sh
│   └── nginx_setup.sh
│
├── variables.tf
├── terraform.tfvars
├── main.tf
├── outputs.tf
├── locals.tf
├── .gitignore
└── README.md
```

---

## Features Implemented
- Terraform modules & variables with validation
- Dynamic backend server provisioning
- HTTPS using self-signed SSL
- Nginx caching with HIT/MISS verification
- Load balancing with backup server
- Security headers & HTTP → HTTPS redirect

---

## Deployment Steps
```bash
ssh-keygen -t rsa -b 4096
terraform init
terraform validate
terraform plan
terraform apply -auto-approve
```

---

## Testing & Verification
- Load balancing between web-1 & web-2
- Backup server activation (web-3)
- Cache verification via headers
- AWS Console resource verification

---

## Cleanup
```bash
terraform destroy
```

---

## Common Issues
- **SSH Issues:** Check key permissions & security groups  
- **Backend Down:** Verify Apache service  
- **SSL Errors:** Check certificate paths  

---

## Conclusion
This assignment strengthened understanding of **Terraform**, **AWS cloud infrastructure**, and **Nginx performance & security optimization**.
