provider "google" {
  credentials = file(".creds/cf-poc.json")
  project     = "{var.project_id}"
  region      = "{var.region}"
}

provider "google-beta" {
  credentials = file(".creds/cf-poc.json")
  project     = "{var.project_id}"
  region      = "{var.region}"
}
