variable "linux_vm" {
  type = map(object({
    nic_name             = string
    location             = string
    resource_group_name  = string
    subnet_name          = string
    virtual_network_name = string
    vm                   = string
    size                 = string
    admin_username       = string
    admin_password       = string
    os_disk = map(object({
      caching              = string
      storage_account_type = string
    }))
    source_image_reference = map(object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    }))

  }))
}


variable "network" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    dns_servers         = optional(list(string))
    subnet = map(object({
      sub_name       = string
      address_prefix = list(string)
    }))
    tags = optional(map(string))
  }))

}


variable "rg" {
  type = map(object({
    name     = string
    location = string
    tags     = map(string)
  }))

}

