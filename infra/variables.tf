variable "project_id" {
  type    = string
  default = "lab-endreo"
}

variable "region" {
  type    = string
  default = "us-central1"
}

variable "zone" {
  type    = string
  default = "us-central1-c"
}

variable "vm_name" {
  type    = string
  default = "devops-api-vm"
}

variable "machine_type" {
  type    = string
  default = "e2-medium"
}

variable "image" {
  type    = string
  default = "debian-cloud/debian-12"
}

variable "size" {
  type    = number
  default = 20
}



variable "static_ip" {
  type    = string
  default = "ip-apidevops"
}