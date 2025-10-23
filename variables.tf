variable "external_port" {
  description = "Porta esposta sul tuo host"
  type        = number
  default     = 8081
  validation {
    condition     = var.external_port >= 1 && var.external_port <= 65535
    error_message = "La porta deve essere tra 1 e 65535."
  }
}

variable "image_tag" {
  description = "Tag dell'immagine NGINX"
  type        = string
  default     = "latest" # es. 'alpine' o '1.27-alpine'
}

variable "container_name" {
  description = "Nome del container"
  type        = string
  default     = "nginx"
}

# HTML Vars
variable "page_title" {
  type    = string
  default = "Benvenuto!"
}
variable "bg" {
  type    = string
  default = "#ffffff"
}
variable "fg" {
  type    = string
  default = "#222222"
}

# DB Vars
variable "pg_image" {
  type    = string
  default = "postgres:16-alpine"
}
variable "pg_db" {
  type    = string
  default = "appdb"
}
variable "pg_user" {
  type    = string
  default = "appuser"
}
variable "pg_port" {
  type    = number
  default = 5433
} # 5432 spesso occupata
variable "pg_password" {
  type        = string
  sensitive   = true
  description = "Password per l'utente Postgres"
}
variable "pg_ro_user" {
  type        = string
  default     = "appreader"
  description = "Utente read-only"
}
variable "pg_ro_password" {
  type        = string
  sensitive   = true
  description = "Password dell'utente read-only"
}
