# jenkinsCICD--Ansible-automation
push code to GitHub, Jenkins triggers the pipeline. Terraform provisions a new EC2 instance on AWS. Once the instance is ready, Ansible connects to it via SSH and installs Apache, deploys the application, and performs validation.
Integrated GitHub with Jenkins using SSH-based authentication. Jenkins stores the private key securely in credentials, while the public key is registered with GitHub, enabling secure and automated repository access.


  git push
   ↓
Jenkins pulls code from GitHub
   ↓
Terraform creates EC2
   ↓
Terraform outputs EC2 IP
   ↓
Ansible uses IP to configure server
   ↓
Application deployed


Automated installation and configuration of Apache HTTP Server on AWS EC2 using Ansible

Implemented idempotent playbooks to ensure consistent and repeatable deployments

Used Ansible handlers to restart Apache services only when configuration changes occurred

Deployed a static HTML website using Ansible modules such as apt, copy, and service

Managed inventory and host groups for environment-based deployments

Verified service availability using systemctl and curl

Configured AWS Security Groups to allow HTTP (port 80) access securely

Followed Infrastructure as Code (IaC) principles for scalable server provisioning


