module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name                   = "Jenkins"
  instance_type          = "t2.large"
  key_name               = var.key_name    # key name as variable
  monitoring             = false
  count                  = 1    # Number of instances
  ami                    = "ami-04a81a99f5ec58529"

  root_block_device = [
    {
      volume_size = 20
    }
  ]

  user_data = <<-EOF
    #!/bin/bash
    
    # Update package manager repositories
    sudo apt-get update -y

    # Install OpenJDK 17 JRE Headless
    sudo apt install openjdk-17-jre-headless -y

    # Install necessary dependencies
    sudo apt-get install -y wget zip apt-transport-https ca-certificates curl software-properties-common
    
    # Download Jenkins GPG key
    sudo wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
    
    # Add Jenkins repository to package manager sources
    echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
    
    # Update package manager repositories
    sudo apt-get update
    
    # Install Jenkins
    sudo apt-get install -y jenkins
    
    # Add Docker's official GPG key
    sudo apt-get update
    sudo apt-get install -y ca-certificates curl
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc

    # Add the Docker repository to Apt sources
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update

    # Install Docker
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    sudo usermod -aG docker jenkins
    sudo chmod 666 /var/run/docker.sock
    
    # Grant Jenkins user sudo privileges
    sudo usermod -aG sudo jenkins

    # Install Trivy
    sudo apt-get update -y
    sudo apt-get install -y wget apt-transport-https gnupg lsb-release
    wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | sudo apt-key add -
    echo "deb https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main" | sudo tee -a /etc/apt/sources.list.d/trivy.list
    sudo apt-get update -y
    sudo apt-get install -y trivy

    
    # Install kubectl
    curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.19.6/2021-01-05/bin/linux/amd64/kubectl
    chmod +x ./kubectl
    sudo mv ./kubectl /usr/local/bin
    kubectl version --short --client
  EOF

  vpc_security_group_ids = [aws_security_group.jenkins_sg.id]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

output "jenkins_instance_public_ip" {
  value = module.ec2_instance[0].public_ip
}
