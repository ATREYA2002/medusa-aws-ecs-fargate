output "rds_endpoint" {
  description = "PostgreSQL RDS endpoint"
  value       = aws_db_instance.medusa_db.endpoint
}
