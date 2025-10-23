output "url" {
  value       = "http://localhost:${var.external_port}"
  description = "Endpoint locale dell'app"
}

output "container_id" {
  value       = docker_container.nginx.id
  description = "ID del container creato"
}

output "pg_connection_url" {
  value       = "postgresql://${var.pg_user}:${var.pg_password}@localhost:${var.pg_port}/${var.pg_db}"
  sensitive   = true
  description = "URL di connessione a Postgres (non stampato in chiaro)."
}
