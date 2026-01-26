variable "sql_database" {
  type = map(object({
    sql_database_name   = string
    collation           = string
    license_type        = string
    max_size_gb         = number
    sku_name            = string
    enclave_type        = string
    tags                = map(string)
    server_name         = string
    resource_group_name = string
  }))

}