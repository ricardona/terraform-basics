terraform {
    required_providers {
      docker = {
        source = "kreuzwerker/docker"
        version = ">= 2.13.0"
      }
    }
}

locals {
  docker_container_name_0 = "tutorial_0"
  docker_container_name_1 = "tutorial_1"
}

provider "docker" {
  host = "npipe:////.//pipe//docker_engine"
}

# Pulls the image
resource "docker_image" "nginx" {
  name = var.nginx_image
}

resource "docker_container" "nginx_container_0" {
  image = docker_image.nginx.image_id
  name  = local.docker_container_name_0
  ports {
    internal = var.internal_container_port
    external = var.external_container_port
  }
}

resource "docker_container" "nginx_container_1" {
  image = docker_image.nginx.image_id
  name  = local.docker_container_name_1
  ports {
    internal = var.internal_container_port
    external = var.external_container_port + 1
  }
}

output "container_name_0" {
    value = docker_container.nginx_container_0.name
}

output "container_name_1" {
    value = docker_container.nginx_container_1.name  
}