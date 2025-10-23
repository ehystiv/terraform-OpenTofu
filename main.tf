terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

provider "docker" {
  # Su macOS con Docker Desktop in genere non serve altro.
  # Se usi Colima/remote daemon puoi anche impostare:
  # host = "unix:///var/run/docker.sock"
  # oppure host = "tcp://127.0.0.1:2375"
}
