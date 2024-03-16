
resource "random_string" "root_password" {
  length           = 5
  override_special = "%*()-_=+[]{}?"
}

resource "google_sql_user" "root" {
  name     = "root"
  instance = google_sql_database_instance.primary.name
  password = random_string.root_password.result
}