# resource "aws_security_group" "jenkins_sg" {
#   name_prefix = "jenkins-sg-"

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#     description = "Allow SSH access"
#   }

#   # Jenkins default port
#   ingress {
#     from_port   = 8080
#     to_port     = 8080
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#     description = "Allow Jenkins web interface"
#   }

#   # Docker daemon port
#   ingress {
#     from_port   = 2376
#     to_port     = 2376
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#     description = "Allow Docker daemon"
#   }

#   # Kubernetes API server port
#   ingress {
#     from_port   = 6443
#     to_port     = 6443
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#     description = "Allow Kubernetes API server"
#   }

#   # HTTP port
#   ingress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#     description = "Allow HTTP traffic"
#   }

#   # HTTPS port
#   ingress {
#     from_port   = 443
#     to_port     = 443
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#     description = "Allow HTTPS traffic"
#   }

#   # SMTP port
#   ingress {
#     from_port   = 25
#     to_port     = 25
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#     description = "Allow SMTP traffic"
#   }

#   # SMTPS port
#   ingress {
#     from_port   = 465
#     to_port     = 465
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#     description = "Allow SMTPS traffic"
#   }

#   # Custom TCP ports range 3000 - 10000
#   ingress {
#     from_port   = 3000
#     to_port     = 10000
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#     description = "Allow custom TCP ports 3000-10000"
#   }

#   # Custom TCP ports range 30000 - 32767
#   ingress {
#     from_port   = 30000
#     to_port     = 32767
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#     description = "Allow custom TCP ports 30000-32767"
#   }

#   tags = {
#     Name = "jenkins-sg"
#   }
# }
## Jenkins  ends

#Nexus Security Group starts
resource "aws_security_group" "nexus_sg" {
  name_prefix = "nexus-sg-"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow SSH access"
  }

  # Nexus default port
  ingress {
    from_port   = 8081
    to_port     = 8081
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow Nexus web interface"
  }

  # Docker daemon port
  ingress {
    from_port   = 2376
    to_port     = 2376
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow Docker daemon"
  }

  # HTTP port
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTP traffic"
  }

  # HTTPS port
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTPS traffic"
  }

  tags = {
    Name = "nexus-sg"
  }
}
#Nexus ends

#SonarQube Security group Start
resource "aws_security_group" "sonarqube_sg" {
  name_prefix = "sonarqube-sg-"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow SSH access"
  }

  # Docker daemon port
  ingress {
    from_port   = 2376
    to_port     = 2376
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow Docker daemon"
  }

  # HTTP port Default Port
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTP traffic"
  }

    # SonarQube Port
  ingress {
    from_port   = 9000
    to_port     = 9000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTP traffic"
  }

  # HTTPS port
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTPS traffic"
  }

  tags = {
    Name = "sonarqube-sg"
  }
}
#SonarQube Ends