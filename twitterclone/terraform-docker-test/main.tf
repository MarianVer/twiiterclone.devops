# 1. Вказуємо, які провайдери потрібні (Docker)
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"  # Офіційний провайдер Docker
      version = "~> 3.0.0"            # Версія (3.0.0 або новіша)
    }
  }
}

# 2. Налаштування Docker (якщо Docker встановлено локально, нічого не міняй)
provider "docker" {}

# 3. Приклад: створення контейнера Nginx
resource "docker_image" "nginx" {
  name = "nginx:latest"  # Завантажить образ Nginx
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "my-nginx"
  ports {
    internal = 80    # Порт у контейнері
    external = 8080  # Порт на твоєму комп'ютері
  }
}
