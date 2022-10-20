terraform {
    required_providers {
      docker = {
        source = "kreuzwerker/docker"
        version = ">= 2.22.0"
      }
    }
}

provider "docker" {
  host = "npipe:////.//pipe//docker_engine"
}

# Pulls the image
resource "docker_image" "local_docker_image" {
  name = var.docker_image
}

resource "docker_container" "local_docker_container" {
  count = var.container_pool_count
  image = docker_image.local_docker_image.image_id
  name  = var.container_pool_count > 1 ? "${var.docker_container_name}_${count.index}" : var.docker_container_name
  ports {
    internal = var.internal_container_port + count.index
    external = var.external_container_port + count.index
  }
}