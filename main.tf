provider "google" {
  project = "tuula-dev-426211"
  region  = "europe-west4"
}

resource "google_container_cluster" "primary" {
  name     = "primary-cluster"
  location = "europe-west4"

  initial_node_count = 3

  node_config {
    machine_type = "e2-medium"

    oauth_scopes = [
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/servicecontrol",
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/trace.append",
    ]
  }
}

output "endpoint" {
  value = google_container_cluster.primary.endpoint
}

output "cluster_name" {
  value = google_container_cluster.primary.name
}

output "kubeconfig" {
  value = google_container_cluster.primary.endpoint
}
