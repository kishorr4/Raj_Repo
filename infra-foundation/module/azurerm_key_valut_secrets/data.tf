data "azurerm_key_vault" "example" {
  for_each            = var.key_secrets
  name                = each.value.key_vault_name
  resource_group_name = each.value.resource_group_name
}
