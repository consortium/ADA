resource "google_container_cluster" "primary" {
  name               = "${var.gke_cluster_name}"
  region             = "${var.gke_cluster_region}"
  initial_node_count = "${var.gke_node_count}"
  min_master_version = "${var.gke_version}"

  addons_config {
    network_policy_config {
      disabled = false
    }
  }

  node_config {
    labels {
      cluster     = "fiduswriter-runtime"
      environment = "${var.gke_environment}"
    }
  }

  network_policy {
    enabled = true
  }
}
