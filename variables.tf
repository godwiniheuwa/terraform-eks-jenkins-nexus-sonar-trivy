
# Variable for the SSH key name
variable "key_name" {
  description = "Name of the SSH key pair for EC2 instances"
  type        = string
  default     = "kube-demo"  # Default value for the SSH key pair
}


##Kubernetest variables

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_a_cidr" {
  description = "The CIDR block for subnet A"
  type        = string
  default     = "10.0.1.0/24"
}

variable "subnet_b_cidr" {
  description = "The CIDR block for subnet B"
  type        = string
  default     = "10.0.2.0/24"
}

variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
  default     = "honeynet-cluster"
}

variable "node_group_desired_size" {
  description = "Desired number of worker nodes"
  type        = number
  default     = 2
}

variable "node_group_max_size" {
  description = "Maximum number of worker nodes"
  type        = number
  default     = 6
}

variable "node_group_min_size" {
  description = "Minimum number of worker nodes"
  type        = number
  default     = 1
}

variable "instance_types" {
  description = "The EC2 instance types for the EKS worker nodes"
  type        = list(string)
  default     = ["t3.medium"]
}

variable "ami_type" {
  description = "The AMI type for the EKS worker nodes"
  type        = string
  default     = "AL2_x86_64"
}
