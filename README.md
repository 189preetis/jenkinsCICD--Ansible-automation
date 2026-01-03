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


