module "Nexus_ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name                   = "Nexus"
  instance_type          = "t2.medium"
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

    # Install necessary dependencies
    sudo apt-get install -y wget zip ca-certificates curl
    
    # Update package manager repositories
    sudo apt-get update
    
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
    sudo chmod 666 /var/run/docker.sock
    
    #run nexus docker server on docker
    docker run -d --name nexus -p 8081:8081 sonatype/nexus3:latest

  EOF

  vpc_security_group_ids = [aws_security_group.nexus_sg.id]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

output "nexus_instance_public_ip" {
  value = module.Nexus_ec2_instance[0].public_ip
}
