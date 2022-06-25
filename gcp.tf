terraform {
    required_providers {
      google ={
        source = "hashicorp/google"
        version = "3.11"
      }
    }
}

provider "google" {
  credentials = file("credentials/skripsi-337606-b2ec25807d58.json")

  project = "skripsi-337606"
  region = "us-central1"
  zone = "us-central1-c"
}

resource "google_compute_instance" "default" {
    name         = "test-2"
    machine_type = "e2-medium"
    zone = "us-central1-a"
    desired_status  = "TERMINATED"

    
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

  metadata = {
    foo = "bar"
  }

}