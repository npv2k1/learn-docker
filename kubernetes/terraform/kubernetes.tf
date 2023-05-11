terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
  }
}

variable "host" {
  type = string
}

variable "client_certificate" {
  type = string
}

variable "client_key" {
  type = string
}

variable "cluster_ca_certificate" {
  type = string
}

provider "kubernetes" {
  host = var.host

  client_certificate     = base64decode(var.client_certificate)
  client_key             = base64decode(var.client_key)
  cluster_ca_certificate = base64decode(var.cluster_ca_certificate)
}

// create storage volume
resource "kubernetes_persistent_volume" "nginx_storage" {
  metadata {
    name = "nginx-storage"

  }

  spec {
    capacity = {
      storage = "10Gi"
    }

    access_modes = ["ReadWriteOnce"]
    # storage_class_name = "standard"
    persistent_volume_source {
      host_path {
        path = "/tmp/nginx-storage"
      }
    }
  }
}

resource "kubernetes_persistent_volume_claim" "nginx_volume_claim" {
  metadata {
    name = "exampleclaimname"
  }
  spec {
    access_modes = ["ReadWriteMany"]
    # storage_class_name = "standard"
    resources {
      requests = {
        storage = "5Gi"
      }
    }
    volume_name = "${kubernetes_persistent_volume.nginx_storage.metadata.0.name}"
  }
}

resource "kubernetes_deployment" "nginx" {
  metadata {
    name = "scalable-nginx-example"
    labels = {
      App = "ScalableNginxExample"
    }
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        App = "ScalableNginxExample"
      }
    }
    template {
      metadata {
        labels = {
          App = "ScalableNginxExample"
        }
      }
      spec {
        container {
          image = "nginx"
          name  = "example"

          port {
            container_port = 80
          }

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }

          # volume_mount {
          #   name       = "exampleclaimname"
          #   mount_path = "/usr/share/nginx/html"
          # }
        }
      }
    }
  }
}




// create a service to expose the deployment

resource "kubernetes_service" "nginx" {
  metadata {
    name = "scalable-nginx-example"
    labels = {
      App = "ScalableNginxExample"
    }
  }

  spec {
    selector = {
      App = "ScalableNginxExample"
    }
    port {
      port        = 80
      target_port = 80
    }
  }
}
