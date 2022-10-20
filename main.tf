locals {
  docker_container_name = "tutorial"  
}

module "local_nginx_container" {
  container_pool_count = 10
  source = "./modules/docker/local_container"
  docker_container_name = local.docker_container_name
  docker_image = var.nginx_image
  external_container_port = var.external_container_port
  internal_container_port = var.internal_container_port
}