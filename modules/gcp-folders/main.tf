resource "google_folder" "management" {
  display_name = "{var.mgt-folder}"
  parent       = "{var.org}"
}

resource "google_folder" "application" {
  display_name = "{var.app-folder}"
  parent       = "{var.org}"
}
