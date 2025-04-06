variable "aws_region" {
  description = "The AWS region to deploy into"
  default     = "ap-south-1"
}

variable "project_name" {
  description = "A name prefix for all resources"
  default     = "medusa"
}

variable "db_username" {
  description = "PostgreSQL master username"
  default     = "postgres"
}

variable "db_password" {
  description = "PostgreSQL master password"
  default     = "MedusaRocks123!"
  sensitive   = true
}

variable "db_name" {
  description = "Initial database name"
  default     = "medusa_db"
}


