# Terraform EKS, Jenkins, Nexus, SonarQube, Trivy, Prometheus, and Grafana Setup

## Overview

This repository contains Terraform configurations for setting up an AWS EKS cluster along with Jenkins, Nexus, SonarQube, Trivy, Prometheus, and Grafana. This setup is designed to provide a comprehensive DevOps environment for continuous integration, continuous deployment, and monitoring.

## Repository Structure

- **eks-cluster.tf**: Terraform configuration for setting up the AWS EKS cluster.
- **jenkins.tf**: Terraform configuration for deploying Jenkins on the EKS cluster.
- **main.tf**: Main Terraform configuration file.
- **nexus.tf**: Terraform configuration for deploying Nexus Repository Manager.
- **prometheus-grafana.tf**: Terraform configuration for deploying Prometheus and Grafana.
- **providers.tf**: Provider configuration, specifying AWS and other necessary providers.
- **RBAC-kubernetes.md**: Documentation for Kubernetes RBAC policies.
- **security-groups.tf**: Terraform configuration for setting up security groups.
- **sonarqube.tf**: Terraform configuration for deploying SonarQube.
- **terraform.tfstate**: Terraform state file (not included in the repository).
- **terraform.tfstate.backup**: Backup of the Terraform state file (not included in the repository).
- **variables.tf**: Variable definitions used throughout the Terraform configurations.

## Prerequisites

- Terraform v1.3 or later
- AWS CLI configured with appropriate credentials
- SSH key pair for accessing EC2 instances

## Usage

### Step 1: Clone the Repository

```sh
git clone https://github.com/godwiniheuwa/terraform-eks-jenkins-nexus-sonar-trivy.git
cd terraform-eks-jenkins-nexus-sonar-trivy
```

### Step 2: Configure Variables

- Edit the variables.tf file to set the required variables such as AWS region, SSH key name, and others. 

### Step 3:  Initialize Terraform

```sh
terraform init
```

### Step 4: Apply Terraform Configuration

```sh
terraform init --auto-approve
```

### Outputs
The Terraform configuration outputs the public IP addresses of the EC2 instances and other relevant information.

##Outputs
- **EKS Cluster Endpoint**: The endpoint for accessing the EKS cluster.
- **Jenkins URL**: The URL for accessing the Jenkins server.
- **Nexus URL**: The URL for accessing the Nexus Repository Manager.
- **Prometheus URL**: The URL for accessing the Prometheus server. (```http://public_ip:9090```)
- **Grafana URL**: The URL for accessing the Grafana dashboard.(```http://public_ip:3000```)
- **SonarQube URL**: The URL for accessing the SonarQube server.

### Contributing
Contributions are welcome! Please open an issue or submit a pull request for any changes or additions.