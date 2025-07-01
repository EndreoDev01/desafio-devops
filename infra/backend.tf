terraform {
  backend "gcs" {
    bucket = "bucket-tfstate-globo"
    prefix = "terraform/state"
  }
}
