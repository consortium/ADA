provider "google" {
  credentials = "${file(var.gcp_svc_account)}"
  project     = "${var.gcp_project}"
}

terraform {
  backend "gcs" {
    prefix = "terraform"
    region = "europe-west3"
  }
}
