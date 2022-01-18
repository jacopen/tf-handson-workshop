terraform {
backend "remote" {
    hostname = "app.terraform.io"
    organization = "broadleaf"
    workspaces {
      name = "workspace-jacopen"
    }
  }
}

provider "google" {
    credentials = var.gcp_key
    project     = var.project
    region      = var.region
}

resource "google_compute_instance" "vm_instance" {
    name = "terraform-instance-${count.index}-jacopen"
    count = var.hello_tf_instance_count
    machine_type = var.machine_type
    zone = "asia-northeast1-a"
    boot_disk {
        initialize_params {
            image = var.image
        }
    }

    network_interface {
        # A default network is created for all GCP projects
        network       = "default"
        access_config {
        }
    }
	}