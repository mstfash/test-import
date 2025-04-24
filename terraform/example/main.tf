terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "5.47.0"
        }
    }
}

variable "cluster_name" {
    default = "main"
}

provider "aws" {
    region = "us-west-2"
}

resource "aws_iam_role_policy_attachment" "my_eks_cluster_policy_attachment" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

resource "aws_iam_role_policy_attachment" "my_eks_service_policy_attachment" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
}

resource "aws_iam_role" "main" {
}

resource "aws_s3_bucket" "my_bucket" {
}

resource "aws_eks_cluster" "main" {
    name = var.cluster_name
    role_arn = aws_iam_role.main.arn
}

resource "aws_eks_cluster" "my_cluster" {
    name = "my-cluster"
    version = "1.21"
    vpc_config {
        subnet_ids = [
            "subnet-12345678",
            "subnet-87654321",
        ]
    }
}