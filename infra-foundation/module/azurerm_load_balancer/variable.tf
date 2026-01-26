variable "azure_lb" {
  type = map(object({
    lb_name               = string
    location              = string
    resource_group_name   = string
    fip_name              = string
    backend_pool_name     = string
    lb_rule_name          = string
    protocol              = string
    frontend_port         = number
    backend_port          = number
    lb_prob_name          = string
    port                  = number
    ip_configuration_name = string
    nic_name              = string
    lb_pip_name           = string
  }))

}


data "azurerm_public_ip" "lb_pip" {
  for_each            = var.azure_lb
  name                = each.value.lb_pip_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_network_interface" "nic" {
  for_each            = var.azure_lb
  name                = each.value.nic_name
  resource_group_name = each.value.resource_group_name
}

