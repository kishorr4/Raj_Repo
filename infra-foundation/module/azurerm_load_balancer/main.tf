resource "azurerm_lb" "example" {
  for_each            = var.azure_lb
  name                = each.value.lb_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  frontend_ip_configuration {
    name                 = each.value.fip_name
    public_ip_address_id = data.azurerm_public_ip.lb_pip[each.key].id
  }
}

resource "azurerm_lb_backend_address_pool" "BackEndAddressPool" {
  for_each        = var.azure_lb
  loadbalancer_id = azurerm_lb.example[each.key].id
  name            = each.value.backend_pool_name
}


resource "azurerm_lb_rule" "lb_rule" {
  for_each                       = var.azure_lb
  loadbalancer_id                = azurerm_lb.example[each.key].id
  name                           = each.value.lb_rule_name
  protocol                       = each.value.protocol
  frontend_port                  = each.value.frontend_port
  backend_port                   = each.value.backend_port
  frontend_ip_configuration_name = each.value.fip_name
  probe_id                       = azurerm_lb_probe.hp[each.key].id
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.BackEndAddressPool[each.key].id]
}


resource "azurerm_lb_probe" "hp" {
  for_each        = var.azure_lb
  loadbalancer_id = azurerm_lb.example[each.key].id
  name            = each.value.lb_prob_name
  port            = each.value.port
}


resource "azurerm_network_interface_backend_address_pool_association" "example" {
  for_each                = var.azure_lb
  network_interface_id    = data.azurerm_network_interface.nic[each.key].id
  ip_configuration_name   = each.value.ip_configuration_name
  backend_address_pool_id = azurerm_lb_backend_address_pool.BackEndAddressPool[each.key].id
}


