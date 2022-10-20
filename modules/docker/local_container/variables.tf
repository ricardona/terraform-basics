variable "docker_image" {
  description = "Docker Image Name"
  type = string  
}

variable "external_container_port" {
  description = "Published Host Port "
  type = number
}

variable "internal_container_port" {
  description = "Internal Container Port"
  type = number
}

variable "docker_container_name" {
  description = "Docker Container Name"
  type = string  
}

variable "container_pool_count" {
  description = "Docker Container Pool Name"
  type = number
  default = 1

  validation {
    condition     = var.container_pool_count >= 0
    error_message = "The count must be greater or equal to 0"
  }
}
