pipeline {
    agent any

    environment {
        AWS_REGION = "ap-south-1"
    }

    stages {

        stage('Checkout Code') {
            steps {
                git branch: 'main',
                    credentialsId: 'github-ssh',
                    url: 'git@github.com:189preetis/jenkinsCICD--Ansible-automation.git'
            }
        }

        stage('Terraform Init') {
            steps {
                dir('.') {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                dir('.') {
                    sh 'terraform apply -auto-approve'
                }
            }
        }

        stage('Fetch EC2 Public IP') {
            steps {
                script {
                    env.EC2_IP = sh(
                        script: "terraform output -raw ec2_public_ip",
                        returnStdout: true
                    ).trim()
                }
            }
        }

        stage('Generate Ansible Inventory') {
            steps {
                sh '''
                echo "[web]" > Ansible/hosts
                echo "${EC2_IP} ansible_user=ubuntu" >> Ansible/hosts
                '''
            }
        }

        stage('Run Ansible Playbook') {
            steps {
                sshagent(credentials: ['github-ssh']) {
                    sh '''
                    ansible-playbook -i Ansible/hosts Ansible/apache.yaml
                    '''
                }
            }
        }
    }

    post {
        success {
            echo "✅ Infrastructure provisioned and Apache deployed successfully"
        }
        failure {
            echo "❌ CI/CD pipeline failed"
        }
    }
}
