resource "azurerm_bastion_host" "azure_bastion" {
  for_each            = var.bastion
  name                = each.value.bastion_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                 = each.value.ip_configuration_name
    subnet_id            = data.azurerm_subnet.example[each.key].id
    public_ip_address_id = data.azurerm_public_ip.example[each.key].id
  }
}



