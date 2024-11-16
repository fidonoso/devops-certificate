terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

# Usar la imagen ya creada con Docker Compose
resource "docker_container" "miapp-tf" {
  image = "app-app" # Nombre de la imagen creada por Docker Compose
  name  = "miapp-certificacion"


  # Opcional: Mantener el contenedor vivo
  stdin_open = true
  tty        = true
}