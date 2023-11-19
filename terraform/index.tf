terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_image" "nodejs-application-monitoring-with-prometheus-and-grafana-example-nodejs-app" {
  name         = "nodejs-application-monitoring-with-prometheus-and-grafana-example-nodejs-app:latest"
  keep_locally = false
}

resource "docker_container" "nodejs-application-monitoring-with-prometheus-and-grafana-example-nodejs-app" {
  image = docker_image.nodejs-application-monitoring-with-prometheus-and-grafana-example-nodejs-app.image_id
  name  = "monitoring"
  ports {
    internal = 2000
    external = 2000
  }
}