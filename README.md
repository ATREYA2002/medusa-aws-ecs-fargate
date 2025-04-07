
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

- Used `npx create-medusa-app@latest` with `--skip-db`
- Setup `.env` with actual `DATABASE_URL` and secrets
- Created a production-ready Dockerfile

### 4. 🐳 Built & Pushed Docker Image

```bash
docker build -t pranidock/medusa-backend .
docker push pranidock/medusa-backend
