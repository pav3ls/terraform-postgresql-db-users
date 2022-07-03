variable "psql_server_name" {
  description = "Specifies the name of the PostgreSQL Server. Changing this forces a new resource to be created."
  type        = string
  default     = "localhost"
}

variable "psql_admin_user" {
  description = "The Administrator Login for the PostgreSQL Server."
  type        = string
  default     = "postgres"
}

variable "psql_admin_password" {
  description = "The Password associated with the administrator login for the PostgreSQL Server."
  type        = string
}

variable "databases_names" {
  description = "The list of names of the PostgreSQL Database."
  type        = list(string)
  default     = ["example1", "example2"]
}

variable "psql_encoding" {
  type    = map(string)
  default = {}
}

variable "db_collation" {
  type    = string
  default = "English_United States.1252"
}

