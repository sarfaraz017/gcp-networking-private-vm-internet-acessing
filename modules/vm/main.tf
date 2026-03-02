resource "google_compute_instance" "private_vm" {
  name         = "private-vm"
  machine_type = "e2-micro"
  zone         = var.zone

  tags = ["private-vm"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    subnetwork = var.subnet
  }

  metadata = {
    enable-oslogin = "TRUE"
  }
}