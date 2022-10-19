terraform {
    required_providers {
      docker = {
        source = "kreuzwerker/docker"
        version = ">= 2.13.0"
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
  image = docker_image.local_docker_image.image_id
  name  = var.docker_container_name
  ports {
    internal = var.internal_container_port
    external = var.external_container_port
  }
}