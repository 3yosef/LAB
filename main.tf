terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.0"
    }
  }
}

provider "docker" {}

# Create a network for the containers
resource "docker_network" "app_network" {
  name = "app_network"

  ipam_config {
    subnet = "192.168.1.0/24"
  }
}

# Define the first hello app container (hello-app-1)
resource "docker_container" "app1" {
  name  = "hello-app-1"
  image = "nginxdemos/hello:latest"

  ports {
    internal = 80
    external = 8081
  }

  networks_advanced {
    name         = docker_network.app_network.id
    ipv4_address = "192.168.1.11"
  }
}

# Define the second hello app container (hello-app-2)
resource "docker_container" "app2" {
  name  = "hello-app-2"
  image = "nginxdemos/hello:latest"

  ports {
    internal = 80
    external = 8082
  }

  networks_advanced {
    name         = docker_network.app_network.id
    ipv4_address = "192.168.1.22"
  }
}

# Build a custom HAProxy image using the Dockerfile
resource "docker_image" "haproxy_image" {
  name = "haproxy:ssh-enabled"

  build {
    context    = "./"    # Path to the directory with Dockerfile and haproxy.cfg
    dockerfile = "Dockerfile"
  }
}

# Define the HAProxy load balancer container
resource "docker_container" "haproxy" {
  name  = "haproxy-load-balancer"
  image = docker_image.haproxy_image.image_id

  ports {
    internal = 8080
    external = 8080  # HTTP port
  }

  ports {
    internal = 8443
    external = 8443  # HTTPS port
  }

  ports {
    internal = 22
    external = 2222  # SSH port
  }

  networks_advanced {
    name         = docker_network.app_network.id
    ipv4_address = "192.168.1.10"
  }

  depends_on = [docker_container.app1, docker_container.app2]
}

