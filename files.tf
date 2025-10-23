locals {
  rendered_index = templatefile("${path.module}/templates/index.html.tftpl", {
    title = var.page_title
    bg    = var.bg
    fg    = var.fg
    port  = var.external_port
    tag   = var.image_tag
    name  = var.container_name
  })
}

resource "local_file" "index_html" {
  filename = "${path.module}/site/index.html"
  content  = local.rendered_index
}
