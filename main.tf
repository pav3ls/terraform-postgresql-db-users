terraform {
  required_providers {
    postgresql = {
      source  = "cyrilgdn/postgresql"
      version = "1.12.0"
    }
  }
  required_version = ">= 0.14.0"
}

provider "postgresql" {
  host      = var.psql_server_name
  port      = 5432
  username  = var.psql_admin_user
  password  = var.psql_admin_password
  sslmode   = "disable"
  superuser = true
}

