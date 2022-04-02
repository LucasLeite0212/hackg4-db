variable "db_user" {
    type = "string
}

variable "db_password" {
    type = "string
}



resource "google_sql_database" "g4_database_playlist" {
  provider = google
  name     = "playlist"
  instance = google_sql_database_instance.g4_instance_playlist.name
}

# See versions at https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance#database_version
resource "google_sql_database_instance" "g4_instance_playlist" {
  provider = google
  name             = "g4-db-playlist"
  database_version = "MYSQL_8_0"
  settings {
    tier = "db-f1-micro"
  }

  deletion_protection  = "true"
}

resource "google_sql_user" "users" {
  name     = TF_VAR_db_user
  instance = google_sql_database_instance.g4_instance_playlist.name
  password = TF_VAR_db_password
}

resource "google_artifact_registry_repository" "artifact_playlist" {
  provider = google-beta
  project = "hackathon-6aso-grupo04"
  location = "us-east1"
  repository_id = "g4-playlist"
  description = "Imagens Docker"
  format = "DOCKER"
}