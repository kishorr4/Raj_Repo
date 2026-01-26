resource "azurerm_key_vault_secret" "secret" {
  for_each     = var.key_secrets
  name         = each.value.secret_name
  value        = each.value.key_value
  key_vault_id = data.azurerm_key_vault.example[each.key].id
}




