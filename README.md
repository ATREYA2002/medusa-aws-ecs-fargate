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
  ![terra apply-rds endpoint](https://github.com/user-attachments/assets/c30e08ae-ce4c-4387-be6d-99303f1a31cc)


### 3. 🧑‍🍳 Installed Medusa Backend

- Used `npx create-medusa-app@latest medusa-backend` with `--skip-db`
- Setup `.env` with actual `DATABASE_URL` and secrets
![create medusa app](https://github.com/user-attachments/assets/dbcfa263-c386-4ffc-91de-80146d20a26c)
![medusa_cli ](https://github.com/user-attachments/assets/f51f34f5-fb3f-49bf-a502-865558c80250)


- Created a production-ready Dockerfile

### 4. 🐳 Built & Pushed Docker Image

![docker image creation](https://github.com/user-attachments/assets/4b1226b5-8515-4229-a14f-3ebee5ffac65)


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
![medus ecs cluster](https://github.com/user-attachments/assets/460927b5-90fe-46e6-939f-cf896382ba3f)
Ecs cluster created 


7.🔐 GitHub Secrets Required

Name	Description
DOCKER_HUB_USERNAME	Docker Hub username
DOCKER_HUB_PASSWORD	Docker Hub password/token
AWS_ACCESS_KEY_ID	AWS IAM access key
AWS_SECRET_ACCESS_KEY	AWS IAM secret key
![image](https://github.com/user-attachments/assets/bff831fb-c9fd-4de3-8047-30668e62ace5)




8. 🧪 Issues Faces
   
⚠️ Medusa backend crashes if essential environment variables like DATABASE_URL or MEDUSA_ADMIN_ONBOARDING_TYPE are not provided.

📦 Terraform state files (.terraform/, terraform.tfstate) and cache caused GitHub push failures due to large file size and local-only dependencies. These were cleaned and ignored using .gitignore.

🐳 Docker image build failed due to missing admin UI (index.html not found). Resolved this by skipping admin onboarding or excluding the admin folder.

🚫 Medusa backend container exited unexpectedly during ECS provisioning, likely due to:

        Missing or outdated Medusa source files

        Conflicts in configuration (e.g., outdated medusa-config.ts)

🔁 GitHub Actions failed during CD because the Docker image build broke due to outdated or partially broken backend code pushed to GitHub. Required a stable and minimal medusa-backend for production builds.
![image](https://github.com/user-attachments/assets/5b371548-422c-4615-a3ac-107d9f6f546b)


