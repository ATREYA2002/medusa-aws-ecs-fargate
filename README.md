Medusa Backend Deployment on AWS ECS using Terraform and GitHub Actions

This project demonstrates how to deploy the Medusa open-source headless commerce backend on AWS ECS with Fargate using Infrastructure as Code (IaC) via Terraform, and automate deployments with GitHub Actions.

🚀 Features

Medusa backend setup using create-medusa-app

Dockerized and pushed to Docker Hub

ECS Cluster with Fargate launch type

RDS PostgreSQL backend

Secure VPC, Subnets, Route Tables, and Security Groups

GitHub Actions pipeline for CI/CD (Docker build and ECS deploy)

🛠️ Technologies Used

Terraform for infrastructure provisioning

AWS ECS + Fargate for container orchestration

Amazon RDS for PostgreSQL database

Docker for containerizing the Medusa backend

GitHub Actions for CI/CD pipeline

📁 Project Structure

medusa-aws-ecs-fargate/
├── medusa-backend/          # Medusa application (Dockerized)
│   ├── Dockerfile
│   ├── medusa-config.ts
│   └── ...
├── medusa-terraform/       # Terraform IaC setup
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── .gitignore
└── .github/workflows/
    └── deploy.yml           # GitHub Actions CD pipeline

📦 Docker Setup

Navigate to medusa-backend/

Build and tag the Docker image:

docker build -t your-dockerhub-username/medusa-backend .

Push to Docker Hub:

docker push your-dockerhub-username/medusa-backend

Update the image URL in main.tf Terraform file:

image = "your-dockerhub-username/medusa-backend:latest"

☁️ Terraform Deployment

Navigate to medusa-terraform/

Set your AWS credentials

Run:

terraform init
terraform apply

Note the rds_endpoint output for the database URL.

🔐 GitHub Actions Setup

Secrets to Add in GitHub

Go to your GitHub repo > Settings > Secrets > Actions and add:

Name

Value

DOCKER_HUB_USERNAME

Your DockerHub username

DOCKER_HUB_PASSWORD

Your DockerHub password

AWS_ACCESS_KEY_ID

IAM user's access key ID

AWS_SECRET_ACCESS_KEY

IAM user's secret access key

The GitHub Action will:

Build the Docker image

Push it to Docker Hub

Update ECS with the new image

⚠️ Issues Faced

The official Medusa documentation had outdated CLI references

Some Docker build issues due to internal errors in medusa-config.ts

Had to manually extract essential files for GitHub upload (excluding huge folders like node_modules and .terraform)
