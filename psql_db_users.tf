resource "random_password" "db_passwords" {
  for_each = toset(var.databases_names)
  special  = false
  length   = 32
}

resource "postgresql_database" "db" {
  for_each          = toset(var.databases_names)
  name              = each.value
  owner             = format("%s_user", each.value)
  encoding          = lookup(var.psql_encoding, each.value, "UTF8")
  connection_limit  = -1
  allow_connections = true
  depends_on        = [postgresql_role.db_user]
}


resource "postgresql_role" "db_user" {
  for_each    = toset(var.databases_names)
  name        = format("%s_user", each.value)
  login       = true
  password    = random_password.db_passwords[each.value].result
  create_role = true
  roles       = []
  search_path = []
}

resource "postgresql_grant" "revoke_public" {
  for_each    = toset(var.databases_names)
  database    = postgresql_database.db[each.value].name
  role        = "public"
  schema      = "public"
  object_type = "schema"
  privileges  = []
}

resource "postgresql_schema" "db_schema" {
  for_each = toset(var.databases_names)
  name     = each.value
  database = postgresql_database.db[each.value].name
  owner    = postgresql_role.db_user[each.value].name
}
