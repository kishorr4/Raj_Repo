variable "nic" {
  type = map(object({
    nic_name_lb                   = string
    location                      = string
    resource_group_name           = string
    private_ip_address_allocation = string
    ip_configuration_name         = string
    subnet_name                   = string
    virtual_network_name          = string
  }))

}