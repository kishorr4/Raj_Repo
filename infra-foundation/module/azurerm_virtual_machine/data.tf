
data "azurerm_subnet" "example" {
  for_each             = var.virtual_machine
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}


data "azurerm_public_ip" "example" {
  for_each            = var.virtual_machine
  name                = each.value.pip_name
  resource_group_name = each.value.resource_group_name
}






data "azurerm_key_vault" "key_vault" {
  for_each            = var.virtual_machine
  name                = each.value.key_vault_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_key_vault_secret" "username" {
  for_each     = var.virtual_machine
  name         = each.value.vm_user_name
  key_vault_id = data.azurerm_key_vault.key_vault[each.key].id
}

data "azurerm_key_vault_secret" "password" {
  for_each     = var.virtual_machine
  name         = each.value.vm_pass_name
  key_vault_id = data.azurerm_key_vault.key_vault[each.key].id
}
