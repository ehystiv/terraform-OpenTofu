# Volume dati persistenti
resource "docker_volume" "pg_data" {
  name = "pg-data"
}

# Immagine Postgres
resource "docker_image" "postgres" {
  name         = var.pg_image
  keep_locally = true
}

# Container Postgres
resource "docker_container" "postgres" {
  name    = "postgres"
  image   = docker_image.postgres.image_id
  restart = "unless-stopped"

  env = [
    "POSTGRES_DB=${var.pg_db}",
    "POSTGRES_USER=${var.pg_user}",
    "POSTGRES_PASSWORD=${var.pg_password}",
  ]

  mounts {
    target = "/var/lib/postgresql/data"
    type   = "volume"
    source = docker_volume.pg_data.name
  }

  ports {
    internal = 5432
    external = var.pg_port
  }

  # Healthcheck semplice
  healthcheck {
    test         = ["CMD-SHELL", "pg_isready -U ${var.pg_user} -d ${var.pg_db}"]
    interval     = "10s"
    timeout      = "3s"
    retries      = 5
    start_period = "10s"
  }
}
