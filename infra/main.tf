provider "google" {
  credentials = file(var.credentials_file)
  project     = var.project_id
  region      = var.region
  zone        = var.zone
}

resource "google_compute_address" "static_ip" {
  name         = var.static_ip
  region       = var.region
  address_type = "EXTERNAL"
  network_tier = "STANDARD"
}

resource "google_compute_instance" "vm_devops" {
  name         = var.vm_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image
      size  = var.size
    }
  }

  network_interface {
    network = "default"
    access_config {
      nat_ip = google_compute_address.static_ip.address
    }
  }

  metadata = {
    ssh-keys = "projetosendreodev:${file("/home/endreo/.ssh/github_actions_key.pub")}"
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    apt update
    apt install -y docker.io docker-compose git
    usermod -aG docker $USER
    systemctl enable docker
    systemctl start docker
  EOT

  tags = ["http-server", "https-server", "ssh", "api", "postgres", "grafana-server", "prometheus", "node-exporter"]
}