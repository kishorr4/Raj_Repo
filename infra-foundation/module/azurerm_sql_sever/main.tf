resource "azurerm_mssql_server" "example" {
  for_each                     = var.sql_server
  name                         = each.value.sql_server_name
  resource_group_name          = each.value.resource_group_name
  location                     = each.value.location
  version                      = each.value.server_version
  administrator_login          = data.azurerm_key_vault_secret.server_username[each.key].value
  administrator_login_password = data.azurerm_key_vault_secret.server_password[each.key].value
  minimum_tls_version          = each.value.minimum_tls_version

  tags = each.value.tags
}



