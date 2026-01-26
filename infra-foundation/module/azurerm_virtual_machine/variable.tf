variable "virtual_machine" {
  type = map(object({
    nic_name                      = string
    location                      = string
    resource_group_name           = string
    ip_configuration_name         = string
    private_ip_address_allocation = string
    vm_name                       = string
    size                          = string
    caching                       = string
    storage_account_type          = string
    publisher                     = string
    offer                         = string
    sku                           = string
    version_vm                    = string
    virtual_network_name          = string
    pip_name                      = string
    key_vault_name                = string
    vm_user_name                  = string
    vm_pass_name                  = string
    subnet_name                   = string

  }))
}

