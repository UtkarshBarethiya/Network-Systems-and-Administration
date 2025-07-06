# Cloud Automation Project (Terraform + Ansible + Docker + GitHub Actions)

## 🔧 Overview

This project automates the provisioning and configuration of AWS EC2 infrastructure and deploys a Dockerized Flask app using:

- **Terraform** for Infrastructure-as-Code (IaC)
- **Ansible** for configuration management
- **Docker** for application containerization
- **GitHub Actions** for CI/CD pipeline automation

---

##  Part 1: Infrastructure Provisioning (Terraform)

### Objective:
Provision AWS infrastructure (VPC, Subnet, Security Group, EC2 Instance).

### Files Used:
- `Terraform/main.tf`  
- `Terraform/vpc.tf`  
- `Terraform/sg.tf`  
- `Terraform/ec2.tf`  
- `Terraform/outputs.tf`  
- `Terraform/backend.tf` (S3 + DynamoDB remote state backend)

### Output:
- AWS EC2 instance deployed in a secure VPC with SSH access

---

## Part 2: Configuration Management (Ansible)

### Objective:
Use Ansible to install Docker, Git, and clone the Flask app on the EC2 instance.

### Files Used:
- `Ansible/playbook.yml`

### Tasks Performed:
- Install Docker
- Enable Docker service
- Install Git
- Clone your private Flask app repo (now configured via SSH)
- Build and run the Docker container

---

##  Part 3: Docker Container Deployment

### Objective:
Containerize and deploy a Flask web app on EC2.

### Files Used:
- `DockerApp/app.py` — Flask app
- `DockerApp/requirements.txt` — Python dependencies
- `DockerApp/Dockerfile` — Build instructions
- `DockerApp/templates/index.html` — HTML template

### App Info:
- Runs on port `5000`
- Served via Docker container on the EC2 instance

---

## ✅ Part 4: CI/CD Pipeline Integration (GitHub Actions)

### Objective:
Use GitHub Actions to automate infrastructure provisioning and app deployment.

### Files Used:
- `.github/workflows/deploy.yml`

### What It Does:
- Uses GitHub Secrets for AWS and SSH credentials
- Initializes and applies Terraform
- Fetches EC2 public IP
- Configures EC2 via Ansible
- Clones repo and runs Docker container

### GitHub Secrets Used:
- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `EC2_SSH_KEY` (private key)
- `EC2_SSH_USER` (e.g., `ubuntu`)

---

## ✅ How to Use

1. Push your changes to GitHub.
2. Go to **Actions** tab → Manually trigger the workflow (choose `apply` or `destroy`).
3. Access the Flask app at:
   ```
   http://<EC2_PUBLIC_IP>:5000
   ```

---

## 📁 Folder Structure

```
.
├── Terraform/
├── Ansible/
├── DockerApp/
└── .github/workflows/
```

---

## 🧾 Author

- Utkarsh Barethiya, MSc in Cyersecurity

---

## 🔗 References

- [Terraform Docs](https://developer.hashicorp.com/terraform/docs)
- [Ansible Docs](https://docs.ansible.com/)
- [Docker Docs](https://docs.docker.com/)
- [GitHub Actions Docs](https://docs.github.com/en/actions)
