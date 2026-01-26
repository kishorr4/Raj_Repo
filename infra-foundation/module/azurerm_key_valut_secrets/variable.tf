variable "key_secrets" {
  type = map(object({
    secret_name         = string
    key_value           = string
    key_vault_name      = string
    resource_group_name = string
  }))

}
