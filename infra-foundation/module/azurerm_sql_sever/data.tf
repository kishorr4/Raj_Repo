data "azurerm_key_vault" "key_vault" {
  for_each            = var.sql_server
  name                = each.value.key_vault_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_key_vault_secret" "server_username" {
  for_each     = var.sql_server
  name         = each.value.sql_server_username
  key_vault_id = data.azurerm_key_vault.key_vault[each.key].id
}

data "azurerm_key_vault_secret" "server_password" {
  for_each     = var.sql_server
  name         = each.value.sql_server_password
  key_vault_id = data.azurerm_key_vault.key_vault[each.key].id
}
