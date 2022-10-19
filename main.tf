locals {
  docker_container_name_0 = "tutorial_0"
  docker_container_name_1 = "tutorial_1"
}

module "local_nginx_container_0" {
  source = "./modules/docker/local_container"
  docker_container_name = local.docker_container_name_0
  docker_image = var.nginx_image
  external_container_port = var.external_container_port
  internal_container_port = var.internal_container_port
}

module "local_nginx_container_1" {
  source = "./modules/docker/local_container"
  docker_container_name = local.docker_container_name_1
  docker_image = var.nginx_image
  external_container_port = var.external_container_port + 1
  internal_container_port = var.internal_container_port + 1
}


output "container_id_0" {
    value = module.local_nginx_container_0.local_container_id
}

output "container_id_1" {
    value = module.local_nginx_container_1.local_container_id
}
