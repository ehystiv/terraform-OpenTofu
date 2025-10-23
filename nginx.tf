resource "docker_image" "nginx" {
  name         = "nginx:${var.image_tag}"
  keep_locally = true
}

resource "docker_container" "nginx" {
  name       = var.container_name
  image      = docker_image.nginx.image_id
  depends_on = [local_file.index_html]

  ports {
    internal = 80
    external = var.external_port
  }

  mounts {
    target    = "/usr/share/nginx/html"
    type      = "bind"
    source    = abspath("${path.module}/site")
    read_only = true
  }

  mounts {
    target    = "/var/log/nginx"
    type      = "volume"
    source    = docker_volume.nginx_logs.name
    read_only = false
  }
}

resource "docker_volume" "nginx_logs" {
  name = "nginx-logs"
}
