# 🚀 Medusa Backend Deployment on AWS ECS (Fargate) using Terraform & GitHub Actions

This project demonstrates the end-to-end deployment of the [Medusa](https://medusajs.com/) open-source headless commerce backend on AWS ECS Fargate. The infrastructure is defined using Terraform, and continuous delivery is enabled using GitHub Actions.

## 📂 Project Structure


---

## ✅ Features

- 📦 Automated deployment of Medusa backend on AWS Fargate
- 🏗 Infrastructure-as-Code using Terraform
- 🐳 Dockerized backend with build & push to Docker Hub
- 🔁 Continuous Deployment via GitHub Actions
- ☁️ PostgreSQL (RDS) setup with live DB endpoint injected
- 🔐 GitHub Secrets used for secure automation

---

## 🛠 Technologies Used

- **Medusa.js**
- **Terraform**
- **AWS ECS, RDS, IAM**
- **Docker**
- **GitHub Actions**

---

## ⚙️ How It Works

### 1. 🧑‍💻 IAM User Creation

Created an IAM user with permissions for:
- ECS
- ECR
- RDS
- VPC
- IAM
- Secrets Manager (optional)

Access keys added as GitHub secrets.

### 2. 🧱 Created Terraform Root Repository

- Built the network layer: VPC, Subnets, IGW
- Defined ECS Cluster, RDS Postgres, IAM roles
- Output: RDS endpoint auto-populated in `DATABASE_URL`

### 3. 🧑‍🍳 Installed Medusa Backend

- Used `npx create-medusa-app@latest medusa-backend` with `--skip-db`
- Setup `.env` with actual `DATABASE_URL` and secrets
- Created a production-ready Dockerfile

### 4. 🐳 Built & Pushed Docker Image

```bash
docker build -t pranidock/medusa-backend .
docker push pranidock/medusa-backend

```


5. 🔁 Set Up GitHub Actions for CD
Configured .github/workflows/deploy.yml to:

Build the Docker image

Push it to Docker Hub

Update ECS task definition automatically


6. 🚀 Deployed via Terraform
```bash
cd medusa-terraform
terraform init
terraform apply
```
7.🔐 GitHub Secrets Required

Name	Description
DOCKER_HUB_USERNAME	Docker Hub username
DOCKER_HUB_PASSWORD	Docker Hub password/token
AWS_ACCESS_KEY_ID	AWS IAM access key
AWS_SECRET_ACCESS_KEY	AWS IAM secret key



8. 🧪 Issues Faces
   
⚠️ Medusa backend crashes if essential environment variables like DATABASE_URL or MEDUSA_ADMIN_ONBOARDING_TYPE are not provided.

📦 Terraform state files (.terraform/, terraform.tfstate) and cache caused GitHub push failures due to large file size and local-only dependencies. These were cleaned and ignored using .gitignore.

🐳 Docker image build failed due to missing admin UI (index.html not found). Resolved this by skipping admin onboarding or excluding the admin folder.

🚫 Medusa backend container exited unexpectedly during ECS provisioning, likely due to:

        Missing or outdated Medusa source files

        Conflicts in configuration (e.g., outdated medusa-config.ts)

🔁 GitHub Actions failed during CD because the Docker image build broke due to outdated or partially broken backend code pushed to GitHub. Required a stable and minimal medusa-backend for production builds.

