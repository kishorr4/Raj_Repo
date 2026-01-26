variable "sql_server" {
  type = map(object({
    sql_server_name     = string
    resource_group_name = string
    location            = string
    minimum_tls_version = string
    tags                = optional(map(string))
    key_vault_name      = string
    sql_server_username = string
    sql_server_password = string
    server_version      = string
  }))

}
