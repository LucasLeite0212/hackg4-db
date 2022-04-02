variable "db_user" {
  type = string
  default = ""
}

variable "db_password" {
  type = string
  default = ""
}

resource "google_sql_database" "spotmusic_database_playlist" {
  provider = google
  name     = "playlist"
  instance = google_sql_database_instance.spotmusic_instance_playlist.name
}

# See versions at https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance#database_version
resource "google_sql_database_instance" "spotmusic_instance_playlist" {
  provider = google
  name             = "spotmusic-db-playlist"
  database_version = "MYSQL_8_0"
  settings {
    tier = "db-f1-micro"
  }

  deletion_protection  = "true"
}

resource "google_sql_user" "users" {
  name     = var.db_user
  instance = google_sql_database_instance.spotmusic_instance_playlist.name
  password = var.db_password
}

resource "google_artifact_registry_repository" "artifact_playlist" {
  provider = google-beta
  project = "hackathon-6aso-grupo04"
  location = "us-east1"
  repository_id = "spotmusic-playlist"
  description = "Imagens Docker"
  format = "DOCKER"
}