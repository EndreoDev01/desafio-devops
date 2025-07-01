provider "google" {
  credentials = file(var.credentials_file)
  project     = var.project_id
  region      = var.region
  zone        = var.zone
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
    access_config {} # Cria IP público
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    apt update
    apt install -y docker.io docker-compose git
    usermod -aG docker $USER
    systemctl enable docker
    systemctl start docker
  EOT

  tags = ["http-server", "https-server", "ssh", "api"]
}
