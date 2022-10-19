variable "external_container_port" {
  description = "Published Host Port "
  type = number
  default = "8080"
}

variable "internal_container_port" {
  description = "Internal Container Port"
  type = number
  default = 80
}

variable "nginx_image" {
  description = "Docker Image Name"
  type = string
  default = "nginx:1.19.0"
}