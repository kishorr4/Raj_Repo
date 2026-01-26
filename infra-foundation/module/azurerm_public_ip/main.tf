resource "azurerm_public_ip" "pip_vm" {
  for_each            = var.azure_pip_vm
  name                = each.value.pip_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  allocation_method   = each.value.allocation_method

  tags = each.value.tags
}

